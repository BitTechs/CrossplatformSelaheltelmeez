part of 'register_cubit.dart';

abstract class RegisterState extends Equatable {
  const RegisterState();
}


class  RegisterInitial extends RegisterState {
  @override
  List<Object> get props => [];
}
class  RegisterSubmit extends RegisterState {
  @override
  List<Object> get props => [];
}
class RegisterSuccess extends RegisterState {
  @override
  List<Object> get props => [];
}
class  RegisterFailed extends RegisterState {
  final String errorMessage;
  const RegisterFailed({required this.errorMessage});
  @override
  List<Object> get props => [];
}


class  ChangeRoleColor extends RegisterState {
  @override
  List<Object> get props => [];
}