part of 'invitation_cubit.dart';

@immutable
abstract class InvitationState {}

class InvitationInitial extends InvitationState {}
class InvitationLoading extends InvitationState {}
class InvitationSuccess extends InvitationState {
  final List<IdentityInvitationResponse> response;
  InvitationSuccess(this.response);
}
class InvitationFailed extends InvitationState {
  final String errorMessage;
  InvitationFailed(this.errorMessage);
}
class InvitationEmpty extends InvitationState {}
