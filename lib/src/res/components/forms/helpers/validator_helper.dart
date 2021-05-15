import 'package:xafe/src/res/regex/regex.dart';

class XafeFormFieldValidator {
  ///For fields that don't require
  ///Further validation
  static String defaultValidator(String value, {String errorMsg}) {
    if (value.isEmpty) {
      return 'Field is required';
    } else {
      return null;
    }
  }

  static String nameValidator(String value, {String errorMsg}) {
    if (value.isEmpty) {
      return 'Name is required';
    } else if (!TdRegex.nameRegExp.hasMatch(value)) {
      return errorMsg ?? 'Please enter only alphabetical characters.';
    } else {
      return null;
    }
  }

  static String emailValidator(String value) {
    if (value.isEmpty) {
      return 'Email field is required';
    } else if (!TdRegex.emailRegex.hasMatch(value)) {
      return 'Enter a valid email';
    } else {
      return null;
    }
  }

  static String phoneNumberValidator(String value) {
    if (value.isEmpty) {
      return 'Phone number is required';
    } else if (value.length < 11) {
      return "Phone number can't be less than 11";
    } else if (!TdRegex.phoneRegExp.hasMatch(value)) {
      return 'Enter a NG phone number';
    } else {
      return null;
    }
  }

  ///Email format validation
  ///[Password Complexity] validation
  static String passwordComplexityValidator(String value) {
    if (value.isEmpty) {
      return 'Password is required';
    } else if (value.length < 6) {
      return '';
    } else if (TdRegex.passwordComplexityRegex.hasMatch(value)) {
      return null;
    } else {
      return '';
    }
  }

  ///[Password] validation
  static String passwordValidator(String value) {
    if (value.isEmpty) {
      return 'Password is required';
    } else if (value.length < 6) {
      return "Password can't be lesss than 8";
    } else {
      return null;
    }
  }
}
