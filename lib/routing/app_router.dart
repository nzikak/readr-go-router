import 'package:go_router/go_router.dart';
import 'package:readr/auth/login_screen.dart';
import 'package:readr/book/book_detail/book_detail.dart';
import 'package:readr/book/home/home_screen.dart';
import 'package:readr/error/error_screen.dart';
import 'package:readr/models/book.dart';
import 'package:readr/onboarding/onboarding_screen.dart';
import 'package:readr/providers/user_provider.dart';
import 'package:readr/splash/splash_screen.dart';

class AppRouter {
  final UserProvider userProvider;

  AppRouter(this.userProvider);

  late final router = GoRouter(
    initialLocation: '/',
    refreshListenable: userProvider,
    redirect: (context, state) {
      if (state.subloc == '/') {
        return null;
      }
      if (!userProvider.isUserOnboarded) {
        return "/onboarding";
      }
      if (!userProvider.isUserLoggedIn) {
        return "/login";
      }

      if (state.subloc == '/onboarding' || state.subloc == '/login') {
        return '/home';
      }
      return null;
    },
    debugLogDiagnostics: true,
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        path: '/onboarding',
        name: 'onboarding',
        builder: (context, state) => const OnboardingScreen(),
      ),
      GoRoute(
        path: '/login',
        name: 'login',
        builder: (context, state) => LoginScreen(),
      ),
      GoRoute(
        path: '/home',
        name: 'home',
        builder: (context, state) => const HomeScreen(),
        routes: [
          GoRoute(
            path: 'book-detail',
            name: 'book-detail',
            builder: (context, state) {
              final book = state.extra as Book;
              return BookDetail(book: book);
            },
          ),
        ],
      ),
    ],
    errorBuilder: (context, state) => ErrorScreen(errorState: state),
  );
}
