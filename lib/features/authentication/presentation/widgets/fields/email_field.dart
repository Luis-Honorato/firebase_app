import 'package:firebase_app/features/authentication/presentation/widgets/fields/field.dart';
import 'package:firebase_app/features/authentication/presentation/widgets/validator/email_validator.dart';
import 'package:flutter/material.dart';

class EmailField extends StatelessWidget {
  final TextEditingController emailController;
  final FocusNode passwordFocusNode;
  const EmailField({
    super.key,
    required this.emailController,
    required this.passwordFocusNode,
  });

  @override
  Widget build(BuildContext context) {
    return Field(
      controller: emailController,
      focusNode: passwordFocusNode,
      validator: (text) => emailValidator(text),
      hintText: "E-mail",
      textInputType: TextInputType.emailAddress,
      obscureText: false,
    );
  }
}
