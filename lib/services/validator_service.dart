import 'package:email_validator/email_validator.dart';

class ValidatorService {
  static bool isEmail(String value) {
    return EmailValidator.validate(value);
  }

  static bool isEmpty(String value) {
    return (value.isEmpty);
  }

  static bool areValuesEquals(String firstValue, String secondValue) {
    return firstValue != secondValue;
  }
}
