import 'dart:developer';

class TextFieldValidation {
  TextFieldValidation() {
    log('calling TextFieldValidation');
  }
  String? emailValidation(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your email';
    } else if (!RegExp(
            r"^[a-zA-Z0-9.!#$%&'*+\/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$")
        .hasMatch(value)) {
      return 'Please enter a valid email address';
    }
    return null;
  }

  String? passwordValidation(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your password';
    } else if (!RegExp(r'^(?=.*[A-Z])(?=.*[a-z])(?=.*[0-9]).{8,}$')
        .hasMatch(value)) {
      return '8 characters, 1 uppercase letter, 1 lowercase letter, and 1 special character.';
    }
    return null;
  }

  String? nameValidation(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a name';
    } else if (value.length < 3) {
      return 'Minimum 3 letters required';
    }
    return null;
  }
}
