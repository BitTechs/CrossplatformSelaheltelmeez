import 'package:json_annotation/json_annotation.dart';
part 'avatar_response.g.dart';

@JsonSerializable()
class AvatarResponse{
  final int id;
  final String imageUrl;
  bool? isSelected;
  AvatarResponse({required this.id, required this.imageUrl});
  factory AvatarResponse.fromJson(Map<String,dynamic> json)=> _$AvatarResponseFromJson(json);
  Map<String,dynamic> toJson()=> _$AvatarResponseToJson(this);

}