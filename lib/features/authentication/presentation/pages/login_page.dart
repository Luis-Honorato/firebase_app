import 'package:firebase_app/features/authentication/presentation/widgets/login/login_form.dart';
import 'package:firebase_app/features/authentication/presentation/widgets/auth_header.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            AuthHeader(
              image: 'lib/assets/enter.png',
              title: 'Login',
            ),
            LoginForm(),
          ],
        ),
      ),
    );
  }
}
