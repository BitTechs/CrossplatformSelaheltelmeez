import 'package:collection/collection.dart';

abstract class IValidationRule<T> {
  final String validationError;
  IValidationRule([this.validationError = ""]);
  bool check(T? value);
}

class IsValidEmailAddressRule extends IValidationRule<String> {
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

class IsValidRequiredRule extends IValidationRule<String> {
  IsValidRequiredRule(String validationError): super(validationError);
  @override
  bool check(String? value) {
    if (value == null) {
      return false;
    }
    return value.isNotEmpty;
  }
}
extension ValidationExtension<T> on List<IValidationRule<T>> {
  String? getValidationErrorMessages(T? value) => firstWhereOrNull((element) => !element.check(value))?.validationError;
}