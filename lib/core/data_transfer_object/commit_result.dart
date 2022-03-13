import 'package:json_annotation/json_annotation.dart';
part 'commit_result.g.dart';

@JsonSerializable()
class CommitResult{
  final String errorMessage;
  final String errorCode;
  final int resultType;
  final bool isSuccess;

  CommitResult({required this.errorMessage, required this.errorCode, required this.resultType, required this.isSuccess});
  factory CommitResult.fromJson(Map<String,dynamic> json)=> _$CommitResultFromJson(json);
  Map<String,dynamic> toJson()=> _$CommitResultToJson(this);
}