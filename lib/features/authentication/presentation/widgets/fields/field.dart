import 'package:firebase_app/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Field extends StatelessWidget {
  final TextEditingController controller;
  final FocusNode focusNode;
  final String hintText;
  final String? Function(String?)? validator;
  final TextInputType? textInputType;
  final void Function(String text)? onChanged;
  final void Function(String? text)? onSaved;
  final void Function()? onEditingComplete;
  final void Function(String text)? onFieldSubmitted;
  final List<TextInputFormatter>? inputFormatters;
  final Widget? suffix;
  final bool obscureText;
  const Field({
    super.key,
    required this.controller,
    required this.focusNode,
    required this.hintText,
    required this.obscureText,
    this.validator,
    this.textInputType,
    this.onChanged,
    this.onSaved,
    this.onEditingComplete,
    this.onFieldSubmitted,
    this.inputFormatters,
    this.suffix,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        fillColor: AppColors.borderColor,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(color: AppColors.borderColor),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(color: AppColors.borderColor),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(color: AppColors.borderColor),
        ),
        hintText: hintText,
        suffixIcon: suffix,
      ),
      obscureText: obscureText,
      cursorColor: AppColors.primaryColor,
      controller: controller,
      focusNode: focusNode,
      validator: validator,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      keyboardType: textInputType,
      onChanged: onChanged,
      onSaved: onSaved,
      onEditingComplete: onEditingComplete,
      onFieldSubmitted: onFieldSubmitted,
      inputFormatters: inputFormatters,
    );
  }
}
