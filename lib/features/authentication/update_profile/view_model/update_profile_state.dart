part of 'update_profile_cubit.dart';

@immutable
abstract class UpdateProfileState {}

class UpdateProfileInitial extends UpdateProfileState {}
class UpdateProfileSubmit extends UpdateProfileState {}
class UpdateProfileSuccess extends UpdateProfileState {}
class UpdateProfileFailed extends UpdateProfileState {
  final String errorMessage;
  UpdateProfileFailed({required this.errorMessage});
}

class UpdateProfileLoadAvatarsSuccess extends UpdateProfileState {}
class UpdateProfileLoadAvatarsSubmit extends UpdateProfileState {}
class UpdateProfileLoadAvatarsFailed extends UpdateProfileState {
  final String errorMessage;
  UpdateProfileLoadAvatarsFailed({required this.errorMessage});
}

class UpdateProfileSelectGenderChange extends UpdateProfileState{}
class UpdateProfileSelectCountryChange extends UpdateProfileState{}

class UpdateProfileSelectAvatarChange extends UpdateProfileState{}


class UpdateProfileLoadGovernoratesSuccess extends UpdateProfileState {}
class UpdateProfileLoadGovernoratesSubmit extends UpdateProfileState {}
class UpdateProfileLoadGovernoratesFailed extends UpdateProfileState {
  final String errorMessage;
  UpdateProfileLoadGovernoratesFailed({required this.errorMessage});
}