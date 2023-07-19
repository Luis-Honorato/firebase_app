import 'package:firebase_app/utils/app_colors.dart';
import 'package:flutter/material.dart';

class EnterWithProviderWidget extends StatelessWidget {
  final String icon;
  final String title;
  final void Function()? callBack;
  const EnterWithProviderWidget({
    super.key,
    required this.icon,
    required this.title,
    this.callBack,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: callBack,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: AppColors.borderColor),
          color: Colors.white,
        ),
        width: 300,
        height: 60,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Image.asset(icon, height: 40),
                  const SizedBox(width: 10),
                  Text(
                    'Login com $title',
                    style: const TextStyle(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              const Icon(Icons.arrow_forward, size: 20),
            ],
          ),
        ),
      ),
    );
  }
}
