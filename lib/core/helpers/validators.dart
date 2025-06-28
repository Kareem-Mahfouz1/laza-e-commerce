class Validator {
  static String? validateUsername(String? value) {
    if (value == null || value.isEmpty) {
      return 'Username is required';
    }
    if (value.length < 3) {
      return 'Username must be at least 3 characters';
    }
    if (!RegExp(r'^[a-zA-Z0-9_ ]+$').hasMatch(value)) {
      return 'only letters, numbers, spaces and underscores are allowed';
    }
    return null;
  }

  static String? validateEmailAddress(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email address is required';
    }
    if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
      return 'Enter a valid email address';
    }
    return null;
  }

  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password is required';
    }
    if (value.length < 4) {
      return 'Password must be at least 4 characters';
    }
    // for strict password validation uncomment te following and adjust password length
    // if (!RegExp(
    //   r'^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]+$',
    // ).hasMatch(value)) {
    //   return 'Password must contain at least one letter, one number, and one special character';
    // }
    return null;
  }
}
