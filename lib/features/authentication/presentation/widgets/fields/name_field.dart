import 'package:firebase_app/features/authentication/presentation/widgets/fields/field.dart';
import 'package:firebase_app/features/authentication/presentation/widgets/validator/name_validator.dart';
import 'package:flutter/material.dart';

class NameField extends StatelessWidget {
  final TextEditingController nameController;
  final FocusNode nameFocusNode;
  final String hintText;
  const NameField({
    super.key,
    required this.nameController,
    required this.nameFocusNode,
    required this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return Field(
      controller: nameController,
      focusNode: nameFocusNode,
      hintText: hintText,
      obscureText: false,
      validator: nameValidator,
    );
  }
}
