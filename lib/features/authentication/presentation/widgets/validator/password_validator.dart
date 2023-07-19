String? passwordValidator(String? text) {
  if (text == null || text.isEmpty) {
    return 'Você precisa digitar uma senha';
  }
  if (text.length <= 5) return 'Senha Fraca';

  return null;
}
