import 'package:firebase_app/features/authentication/presentation/bloc/hide_password_cubit/hidde_password_cubit.dart';
import 'package:firebase_app/features/authentication/presentation/widgets/fields/field.dart';
import 'package:firebase_app/features/authentication/presentation/widgets/login/password_field_suffix_widgets.dart';
import 'package:firebase_app/features/authentication/presentation/widgets/validator/password_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PasswordField extends StatelessWidget {
  final TextEditingController passwordController;
  final FocusNode passwordFocusNode;
  final bool isLogin;
  const PasswordField({
    super.key,
    required this.passwordController,
    required this.passwordFocusNode,
    this.isLogin = true,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HiddePasswordCubit(),
      child: BlocBuilder<HiddePasswordCubit, bool>(
        builder: (context, state) {
          return Field(
            controller: passwordController,
            focusNode: passwordFocusNode,
            validator: (text) => passwordValidator(text),
            hintText: "Senha",
            suffix: PasswordFieldSuffixWidgets(
              onPressed: state
                  ? () => context.read<HiddePasswordCubit>().showPassword()
                  : () => context.read<HiddePasswordCubit>().hiddePassword(),
              isVisible: state,
              isLogin: isLogin,
            ),
            obscureText: state,
            textInputType: TextInputType.visiblePassword,
          );
        },
      ),
    );
  }
}
