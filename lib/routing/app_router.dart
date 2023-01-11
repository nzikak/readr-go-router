import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:readr/auth/login_screen.dart';
import 'package:readr/book/home/home_screen.dart';
import 'package:readr/onboarding/onboarding_screen.dart';
import 'package:readr/providers/user_provider.dart';
import 'package:readr/splash/splash_screen.dart';

class AppRouter {
  final UserProvider userProvider;

  AppRouter(this.userProvider);

  late final router = GoRouter(
    initialLocation: '/',
    redirect: (context, state) {
      if(state.subloc == '/') {
        return null;
      }
      if(!userProvider.isUserOnboarded) {
        return "/onboarding";
      }
      if(!userProvider.isUserLoggedIn) {
        return "/login";
      }

      if(state.subloc == '/onboarding' || state.subloc == '/login') {
        return '/home';
      }
      return null;
    },
    refreshListenable: userProvider,
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
      ),
    ],
  );
}
