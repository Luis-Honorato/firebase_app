import 'package:firebase_app/features/authentication/presentation/bloc/auth_bloc/auth_bloc.dart';
import 'package:firebase_app/features/authentication/presentation/widgets/fields/email_field.dart';
import 'package:firebase_app/features/authentication/presentation/widgets/fields/name_field.dart';
import 'package:firebase_app/features/authentication/presentation/widgets/fields/password_field.dart';
import 'package:firebase_app/features/authentication/presentation/widgets/fields/phone_field.dart';
import 'package:firebase_app/features/authentication/presentation/widgets/register/redirect_to_login_text.dart';
import 'package:firebase_app/utils/button.dart';
import 'package:firebase_app/utils/request_status.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({super.key});

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  late TextEditingController firstNameController;
  late TextEditingController lastNameController;
  late TextEditingController emailController;
  late TextEditingController phoneController;
  late TextEditingController passwordController;

  late FocusNode firstNameFocusNode;
  late FocusNode lastNameFocusNode;
  late FocusNode emailFocusNode;
  late FocusNode phoneFocusNode;
  late FocusNode passwordFocusNode;

  @override
  void initState() {
    super.initState();

    firstNameController = TextEditingController();
    lastNameController = TextEditingController();
    emailController = TextEditingController();
    phoneController = TextEditingController();
    passwordController = TextEditingController();

    firstNameFocusNode = FocusNode();
    lastNameFocusNode = FocusNode();
    emailFocusNode = FocusNode();
    phoneFocusNode = FocusNode();
    passwordFocusNode = FocusNode();
  }

  @override
  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    passwordController.dispose();

    firstNameFocusNode.dispose();
    lastNameFocusNode.dispose();
    emailFocusNode.dispose();
    phoneFocusNode.dispose();
    passwordFocusNode.dispose();
    super.dispose();
  }

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final authBloc = context.read<AuthBloc>();
    return Form(
      key: _formKey,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width / 2.22,
                  child: NameField(
                    nameController: firstNameController,
                    nameFocusNode: firstNameFocusNode,
                    hintText: 'nome',
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width / 2.22,
                  child: NameField(
                    nameController: lastNameController,
                    nameFocusNode: lastNameFocusNode,
                    hintText: 'sobrenome',
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: EmailField(
              emailController: emailController,
              passwordFocusNode: emailFocusNode,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Phonefield(
              phoneController: phoneController,
              phoneFocusNode: phoneFocusNode,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: PasswordField(
              passwordController: passwordController,
              passwordFocusNode: passwordFocusNode,
              isLogin: false,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24),
            child: BlocBuilder<AuthBloc, AuthState>(
              bloc: authBloc,
              builder: (context, state) {
                return Button(
                  onTap: () {
                    if (_formKey.currentState!.validate()) {
                      authBloc.add(
                        RegisterUserEvent(
                          email: emailController.text,
                          password: passwordController.text,
                        ),
                      );
                    }
                  },
                  text: 'Registrar',
                  isLoading:
                      state.registerUserStatus != RequestStatus.initial ||
                          state.registerUserStatus != RequestStatus.success,
                );
              },
            ),
          ),
          const RedirectToLoginText(),
        ],
      ),
    );
  }
}
