extension Validation on String {
  bool get isValidName {
    return RegExp(r'^[a-zA-z]{2,12}$').hasMatch(this);
  }

  bool get isValidEmail {
    return RegExp(
            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(this);
  }

  bool get isValidPassword {
    return RegExp(r'^[a-zA-z0-9]{10,16}$').hasMatch(this);
  }
}
