class Validators {
  static isEmailValid(String email) {
    final emailRegex = RegExp(r"^[a-zA-Z0-9._-]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    // TODO: Alt tire eklenecek
    return emailRegex.hasMatch(email);
  }
}
