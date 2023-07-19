String? phoneValidator(String? text) {
  if (text == null || text.isEmpty) {
    return 'Por favor digite um telefone válido';
  }
  final bool isPhoneValid =
      RegExp(r'^[(]{1}[0-9]{2}[)]{1} 9[0-9]{4}-[0-9]{4}').hasMatch(text);
  if (!isPhoneValid) return 'Por favor digite um telefone válido';

  return null;
}
