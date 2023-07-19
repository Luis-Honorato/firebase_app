import 'package:firebase_app/features/authentication/presentation/bloc/auth_bloc/auth_bloc.dart';
import 'package:firebase_app/features/authentication/presentation/pages/login_page.dart';
import 'package:firebase_app/features/authentication/presentation/pages/register_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

final router = GoRouter(
  debugLogDiagnostics: true,
  initialLocation: '/',
  redirect: (context, state) {
    final userStatus = context.read<AuthBloc>().state.userStatus;

    return (userStatus == UserStatus.unauthenticated) ? '/' : null;
  },
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const LoginPage(),
    ),
    GoRoute(
      path: '/register',
      builder: (context, state) => const RegisterPage(),
    ),
  ],
);
