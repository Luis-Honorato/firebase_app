import 'package:firebase_app/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class RedirectToLoginText extends StatelessWidget {
  const RedirectToLoginText({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.go('/login'),
      child: const Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Já é cadastrado?',
            style: TextStyle(fontWeight: FontWeight.w500),
          ),
          SizedBox(height: 2.5),
          Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(width: 16),
              Text(
                'Login',
                style: TextStyle(
                  color: AppColors.primaryColor,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Icon(
                Icons.arrow_forward_ios_outlined,
                color: AppColors.primaryColor,
                size: 12,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
