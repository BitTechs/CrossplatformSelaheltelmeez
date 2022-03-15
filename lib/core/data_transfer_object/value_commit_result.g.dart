// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'value_commit_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ValueCommitResult<T> _$ValueCommitResultFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) =>
    ValueCommitResult<T>(
      errorMessage: json['errorMessage'] as String?,
      errorCode: json['errorCode'] as String?,
      resultType: json['resultType'] as int,
      isSuccess: json['isSuccess'] as bool,
      value: _$nullableGenericFromJson(json['value'], fromJsonT),
    );

Map<String, dynamic> _$ValueCommitResultToJson<T>(
  ValueCommitResult<T> instance,
  Object? Function(T value) toJsonT,
) =>
    <String, dynamic>{
      'errorMessage': instance.errorMessage,
      'errorCode': instance.errorCode,
      'resultType': instance.resultType,
      'isSuccess': instance.isSuccess,
      'value': _$nullableGenericToJson(instance.value, toJsonT),
    };

T? _$nullableGenericFromJson<T>(
  Object? input,
  T Function(Object? json) fromJson,
) =>
    input == null ? null : fromJson(input);

Object? _$nullableGenericToJson<T>(
  T? input,
  Object? Function(T value) toJson,
) =>
    input == null ? null : toJson(input);
