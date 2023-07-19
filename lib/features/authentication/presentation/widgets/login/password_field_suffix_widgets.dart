import 'package:firebase_app/utils/app_colors.dart';
import 'package:flutter/material.dart';

class PasswordFieldSuffixWidgets extends StatelessWidget {
  final bool isVisible;
  final bool isLogin;
  final void Function()? onPressed;
  const PasswordFieldSuffixWidgets({
    super.key,
    required this.isVisible,
    required this.isLogin,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 2.0,
        vertical: 8,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        mainAxisSize: MainAxisSize.min,
        children: [
          Visibility(
            visible: isLogin,
            child: GestureDetector(
              child: const Text(
                'Esqueceu?',
                style: TextStyle(
                  color: AppColors.primaryContrastColor,
                ),
              ),
            ),
          ),
          IconButton(
            onPressed: onPressed,
            icon: Icon(
              isVisible ? Icons.visibility : Icons.visibility_off,
              color: Colors.grey,
            ),
          )
        ],
      ),
    );
  }
}
