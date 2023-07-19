import 'package:firebase_app/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class RegisterAccountText extends StatelessWidget {
  const RegisterAccountText({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.go('/register'),
      child: const Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Não Tem uma conta?',
            style: TextStyle(fontWeight: FontWeight.w500),
          ),
          SizedBox(height: 2.5),
          Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(width: 16),
              Text(
                'Registro',
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
