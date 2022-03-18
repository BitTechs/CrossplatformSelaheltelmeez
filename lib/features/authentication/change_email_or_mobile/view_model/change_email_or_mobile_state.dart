part of 'change_email_or_mobile_cubit.dart';

@immutable
abstract class ChangeEmailOrMobileState {}

class ChangeEmailOrMobileInitial extends ChangeEmailOrMobileState {}
class ChangeEmailOrMobileSubmit extends ChangeEmailOrMobileState {}
class ChangeEmailOrMobileSuccess extends ChangeEmailOrMobileState {}
class ChangeEmailOrMobileFailed extends ChangeEmailOrMobileState {
  final String errorMessage;
  ChangeEmailOrMobileFailed({required this.errorMessage});
}
