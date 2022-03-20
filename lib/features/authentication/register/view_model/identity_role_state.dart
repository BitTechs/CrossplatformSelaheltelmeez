part of 'identity_role_cubit.dart';

@immutable
abstract class IdentityRoleState {}

class IdentityRoleInitial extends IdentityRoleState {}
class IdentityRoleStudentState extends IdentityRoleState {}
class IdentityRoleParentState extends IdentityRoleState {}
class IdentityRoleTeacherState extends IdentityRoleState {}
