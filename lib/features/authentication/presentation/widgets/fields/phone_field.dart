import 'package:firebase_app/features/authentication/presentation/widgets/fields/field.dart';
import 'package:firebase_app/features/authentication/presentation/widgets/validator/phone_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_multi_formatter/formatters/masked_input_formatter.dart';

class Phonefield extends StatelessWidget {
  final TextEditingController phoneController;
  final FocusNode phoneFocusNode;
  const Phonefield({
    super.key,
    required this.phoneController,
    required this.phoneFocusNode,
  });

  @override
  Widget build(BuildContext context) {
    return Field(
      controller: phoneController,
      focusNode: phoneFocusNode,
      hintText: '(11) 91111-1111',
      obscureText: false,
      validator: phoneValidator,
      inputFormatters: [
        MaskedInputFormatter('(##) #####-####'),
      ],
    );
  }
}
