import 'package:events_app/features/auth/presentation/pages/login_screen.dart';
import 'package:events_app/features/auth/presentation/pages/sign_up_screen.dart';
import 'package:events_app/features/onboarding/presentation/pages/on_boarding_screen.dart';
import 'package:events_app/features/splash/presentation/pages/splash_screen.dart';
import 'package:events_app/main_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(path: '/', builder: (context, state) => const MainScaffold()),
      GoRoute(
          path: '/onBoarding',
          builder: (context, state) => const OnBoardingScreen()),
      GoRoute(path: '/login', builder: (context, state) => const LoginScreen()),
      GoRoute(
          path: '/signUp', builder: (context, state) => const SignUpScreen()),
      GoRoute(
          path: '/mainScaffold',
          builder: (context, state) => const MainScaffold()),
    ],
    errorBuilder: (context, state) =>
        Scaffold(body: Center(child: Text('Page not found: ${state.uri}'))),
  );
}
