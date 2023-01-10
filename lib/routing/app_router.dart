import 'package:go_router/go_router.dart';
import 'package:readr/onboarding/onboarding_screen.dart';
import 'package:readr/splash/splash_screen.dart';

class AppRouter {
  late final router = GoRouter(
    initialLocation: '/',
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
    ],
  );
}
