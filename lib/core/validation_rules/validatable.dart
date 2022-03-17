import 'package:collection/collection.dart';

abstract class ValidationRule {
  final String validationError;

  ValidationRule([this.validationError = ""]);

  bool check(String? value);
}
class IsInRangeOf extends ValidationRule {
  final int min;
  final int max;

  IsInRangeOf(String validationError, {required this.min, required this.max})
      : super(validationError);

  @override
  bool check(String? value) {
    if (value == null) {
      return false;
    }
    int? parsedValue = int.tryParse(value);
    if(parsedValue == null){
      return false;
    }
    return parsedValue >= min && parsedValue <= max;
  }
}
class IsValidEmailAddressRule extends ValidationRule {
  IsValidEmailAddressRule(String validationError) : super(validationError);
  RegExp regExp = RegExp(
    r"^([a-zA-Z0-9_\-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([a-zA-Z0-9\-]+\.)+))([azA-Z]{2,4}|[0-9]{1,3})(\]?)$",
    caseSensitive: false,
    multiLine: false,
  );

  @override
  bool check(String? value) {
    if (value == null) {
      return false;
    }
    return regExp.hasMatch(value);
  }
}
class IsValidEgyptianPhoneNumber extends ValidationRule{
  IsValidEgyptianPhoneNumber(String validationError) : super(validationError);
  RegExp regExp = RegExp(r"^01[0-2,5]\d{8}$",caseSensitive: false,multiLine: false,);
  @override
  bool check(String? value) {
    if (value == null) {
      return false;
    }
    return regExp.hasMatch(value);
  }
}
class IsValidSaudiPhoneNumber extends ValidationRule{
  IsValidSaudiPhoneNumber(String validationError) : super(validationError);
  RegExp regExp = RegExp(r"/^(009665|9665|\+9665|05|5)(5|0|3|6|4|9|1|8|7)([0-9]{7})$/",caseSensitive: false,multiLine: false,);
  @override
  bool check(String? value) {
    if (value == null) {
      return false;
    }
    return regExp.hasMatch(value);
  }
}
class IsValidRequiredRule extends ValidationRule {
  IsValidRequiredRule(String validationError) : super(validationError);

  @override
  bool check(String? value) {
    if (value == null) {
      return false;
    }
    return value.isNotEmpty;
  }
}
class IsValidEmailOrMobileRule extends ValidationRule{
  IsValidEmailOrMobileRule(String validationError) : super(validationError);

  @override
  bool check(String? value) {
    if (value == null) {
      return false;
    }
    return IsValidEmailAddressRule(validationError).check(value) || IsValidEgyptianPhoneNumber(validationError).check(value);
  }
}
class IsValidConfirmPasswordRule extends ValidationRule{
  final String password;
  IsValidConfirmPasswordRule(String validationError,{required this.password}) : super(validationError);
  @override
  bool check(String? value) {
    if (value == null) {
      return false;
    }
    return value == password;
  }
}
extension ValidationExtension on List<ValidationRule> {
  String? getValidationErrorMessage(String? value) =>
      firstWhereOrNull((element) => !element.check(value))?.validationError;

  String? getValidationErrorMessages(String? value) =>
      where((element) => !element.check(value)).fold(null, (previousValue, element) => previousValue! + "\n" + element.validationError);
}
