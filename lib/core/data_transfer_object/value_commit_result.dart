import 'package:json_annotation/json_annotation.dart';

part 'value_commit_result.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class ValueCommitResult<T> {
  final String errorMessage;
  final int errorCode;
  final bool isSuccess;
  final bool isExceptionOccurred;
  final int source;
  final T value;
  ValueCommitResult({required this.errorMessage,required this.errorCode,required this.isSuccess,required this.isExceptionOccurred, required this.source, required this.value});

  factory ValueCommitResult.fromJson(Map<String, dynamic> json,T Function(Object? json) fromJsonT) => _$ValueCommitResultFromJson(json,fromJsonT);

  Map<String, dynamic> toJson(Object Function(T value) toJsonT) => _$ValueCommitResultToJson<T>(this, toJsonT);

}