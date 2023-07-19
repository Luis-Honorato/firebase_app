import 'package:firebase_app/utils/app_colors.dart';
import 'package:flutter/material.dart';

class AuthHeader extends StatelessWidget {
  final String image;
  final String title;
  final bool isRegister;
  const AuthHeader({
    super.key,
    required this.image,
    required this.title,
    this.isRegister = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 3,
      decoration: const BoxDecoration(
        color: AppColors.primaryColor,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(50),
          bottomRight: Radius.circular(50),
        ),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 40.0),
              child: Container(
                padding: const EdgeInsets.only(left: 15.0),
                decoration: BoxDecoration(
                  color: AppColors.primaryContrastColor,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Image.asset(
                    image,
                    height: isRegister ? 100 : 80,
                    width: isRegister ? 100 : 80,
                    color: isRegister
                        ? const Color.fromARGB(255, 223, 221, 221)
                        : null,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 40),
            Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 25,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
