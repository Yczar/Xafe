mixin TdRegex {
  static final RegExp nameRegExp = RegExp('[a-zA-Z]');

  static final RegExp complexNameRegex =
      RegExp(r'[!@#<>?":_`~;[\]\\|=+)(*&^%\s-]');

  static final RegExp emailRegex = RegExp(
      r"^[a-z0-9][-a-z0-9.!#$%&'*+-=?^_`{|}~\/]+@([-a-z0-9]+\.)+[a-z]{2,5}$");

  static final RegExp numberRegExp = RegExp(r'\d');

  static final RegExp phoneRegExp = RegExp(r'^\d\d\d\d\d\d\d\d\d\d\d$');

  static final RegExp alphaNumericRegex = RegExp(r'^[a-zA-Z0-9]+$');

  static final RegExp numericRegex = RegExp(r'^[0-9]*$');

  static final RegExp passwordComplexityRegex =
      RegExp(r'(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*\W)');
}
