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
      errorMessage: json['errorMessage'] as String,
      errorCode: json['errorCode'] as int,
      isSuccess: json['isSuccess'] as bool,
      isExceptionOccurred: json['isExceptionOccurred'] as bool,
      source: json['source'] as int,
      value: fromJsonT(json['value']),
    );

Map<String, dynamic> _$ValueCommitResultToJson<T>(
  ValueCommitResult<T> instance,
  Object? Function(T value) toJsonT,
) =>
    <String, dynamic>{
      'errorMessage': instance.errorMessage,
      'errorCode': instance.errorCode,
      'isSuccess': instance.isSuccess,
      'isExceptionOccurred': instance.isExceptionOccurred,
      'source': instance.source,
      'value': toJsonT(instance.value),
    };
