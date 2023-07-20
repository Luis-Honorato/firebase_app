import 'package:firebase_app/utils/app_colors.dart';
import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final void Function()? onTap;
  final String text;
  final bool isLoading;
  const Button(
      {super.key,
      required this.onTap,
      required this.text,
      this.isLoading = false});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(8),
        width: 350,
        height: 60,
        decoration: BoxDecoration(
          color: AppColors.buttonBackgroundColor,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Center(
          child: isLoading
              ? const CircularProgressIndicator(
                  color: Colors.white,
                )
              : Text(
                  text,
                  style: const TextStyle(
                    color: AppColors.primaryContrastColor,
                    fontSize: 18,
                  ),
                ),
        ),
      ),
    );
  }
}
