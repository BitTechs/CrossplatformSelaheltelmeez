import 'package:json_annotation/json_annotation.dart';
part 'value_commit_result.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class ValueCommitResult<T>{
  final String? errorMessage;
  final String? errorCode;
  final int resultType;
  final bool isSuccess;
  final T? value;

  ValueCommitResult({required this.errorMessage, required this.errorCode, required this.resultType, required this.isSuccess,required this.value,});
  factory ValueCommitResult.fromJson(Map<String,dynamic> json,T Function(Object? json) fromJsonT)=> _$ValueCommitResultFromJson(json,fromJsonT);
  Map<String,dynamic> toJson(Object Function(T value) toJsonT)=> _$ValueCommitResultToJson(this,toJsonT);
}