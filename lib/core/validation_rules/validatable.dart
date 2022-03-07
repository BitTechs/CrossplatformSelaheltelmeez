import 'package:collection/collection.dart';

abstract class IValidationRule {
  final String validationError;
  IValidationRule([this.validationError = ""]);
  bool check(String? value);
}

class IsValidEmailAddressRule extends IValidationRule {
  IsValidEmailAddressRule(String validationError): super(validationError);
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

class IsValidRequiredRule extends IValidationRule {
  IsValidRequiredRule(String validationError): super(validationError);
  @override
  bool check(String? value) {
    if (value == null) {
      return false;
    }
    return value.isNotEmpty;
  }
}
extension ValidationExtension on List<IValidationRule> {
  String? getValidationErrorMessages(String? value) => firstWhereOrNull((element) => !element.check(value))?.validationError;
}