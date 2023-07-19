import 'package:firebase_app/features/authentication/presentation/widgets/fields/email_field.dart';
import 'package:firebase_app/features/authentication/presentation/widgets/fields/password_field.dart';
import 'package:firebase_app/utils/button.dart';
import 'package:firebase_app/features/authentication/presentation/widgets/enter_with_provider_widget.dart';
import 'package:firebase_app/features/authentication/presentation/widgets/login/register_account_text.dart';
import 'package:flutter/material.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final GlobalKey formKey = GlobalKey();
  late final TextEditingController emailController;
  late final FocusNode emailFocusNode;
  late final TextEditingController passwordController;
  late final FocusNode passwordFocusNode;

  @override
  void initState() {
    super.initState();
    emailController = TextEditingController();
    emailFocusNode = FocusNode();
    passwordController = TextEditingController();
    passwordFocusNode = FocusNode();
  }

  @override
  void dispose() {
    emailController.dispose();
    emailFocusNode.dispose();
    passwordController.dispose();
    passwordFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: EmailField(
              emailController: emailController,
              passwordFocusNode: emailFocusNode,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 16,
              right: 16,
              bottom: 16,
            ),
            child: PasswordField(
              passwordController: passwordController,
              passwordFocusNode: passwordFocusNode,
            ),
          ),
          Button(onTap: () {}, text: 'Login'),
          const SizedBox(height: 20),
          const RegisterAccountText(),
          const SizedBox(height: 20),
          EnterWithProviderWidget(
            icon: 'lib/assets/facebook_image.png',
            title: 'Facebook',
            callBack: () {},
          ),
          const SizedBox(height: 5),
          EnterWithProviderWidget(
            icon: 'lib/assets/google_image.png',
            title: 'Google',
            callBack: () {},
          ),
        ],
      ),
    );
  }
}
