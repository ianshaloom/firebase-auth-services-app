class PasswordValidator {
  static bool validate(String password) {
    if (password.isEmpty || (password.isNotEmpty && password.length < 6)) {
      return true;
    } else {
      return false;
    }
  }
}
