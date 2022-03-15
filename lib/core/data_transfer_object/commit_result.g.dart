// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'commit_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CommitResult _$CommitResultFromJson(Map<String, dynamic> json) => CommitResult(
      errorMessage: json['errorMessage'] as String,
      errorCode: json['errorCode'] as String,
      resultType: json['resultType'] as int,
      isSuccess: json['isSuccess'] as bool,
    );

Map<String, dynamic> _$CommitResultToJson(CommitResult instance) =>
    <String, dynamic>{
      'errorMessage': instance.errorMessage,
      'errorCode': instance.errorCode,
      'resultType': instance.resultType,
      'isSuccess': instance.isSuccess,
    };
