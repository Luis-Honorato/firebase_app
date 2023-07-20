import 'package:firebase_app/features/authentication/presentation/bloc/auth_bloc/auth_bloc.dart';
import 'package:firebase_app/features/authentication/presentation/pages/login_page.dart';
import 'package:firebase_app/features/authentication/presentation/pages/register_page.dart';
import 'package:firebase_app/features/home/presentation/page/home_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

final router = GoRouter(
  debugLogDiagnostics: true,
  initialLocation: '/',
  redirect: (context, state) {
    final userStatus = context.read<AuthBloc>().state.userStatus;

    if (userStatus == UserStatus.unauthenticated) return '/login';

    return null;
  },
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const HomePage(),
    ),
    GoRoute(
      path: '/login',
      builder: (context, state) => const LoginPage(),
    ),
    GoRoute(
      path: '/register',
      builder: (context, state) => const RegisterPage(),
    ),
  ],
);
