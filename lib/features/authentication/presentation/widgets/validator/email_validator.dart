String? emailValidator(String? text) {
  if (text == null || text.isEmpty) {
    return 'Você precisa digitar um e-mail';
  }
  final bool emailValid = RegExp(
    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
  ).hasMatch(text);
  if (!emailValid) {
    return "Por favor digite um email válido";
  }

  return null;
}
