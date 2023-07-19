import 'package:firebase_app/features/authentication/presentation/widgets/auth_header.dart';
import 'package:firebase_app/features/authentication/presentation/widgets/register/register_form.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            AuthHeader(
              image: 'lib/assets/register_image.png',
              title: 'Registro',
              isRegister: true,
            ),
            RegisterForm()
          ],
        ),
      ),
    );
  }
}
