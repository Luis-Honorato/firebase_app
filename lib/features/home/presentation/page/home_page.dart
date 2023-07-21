import 'package:firebase_app/features/authentication/presentation/bloc/auth_bloc/auth_bloc.dart';
import 'package:firebase_app/utils/button.dart';
import 'package:firebase_app/utils/request_status.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final AuthBloc authBloc;
  @override
  void initState() {
    super.initState();
    authBloc = context.read<AuthBloc>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: BlocConsumer<AuthBloc, AuthState>(
          bloc: authBloc,
          listener: (context, state) {
            if (state.signOutUserStatus == RequestStatus.success) {
              return context.go('/login');
            }
          },
          builder: (context, state) {
            return Button(
              onTap: () async {
                authBloc.add(SignOutUserEvent());
              },
              text: 'Deslogar',
              isLoading: state.signOutUserStatus != RequestStatus.initial &&
                  state.signOutUserStatus != RequestStatus.success,
            );
          },
        ),
      ),
    );
  }
}
