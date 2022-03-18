import 'package:json_annotation/json_annotation.dart';
part 'governorate_response.g.dart';

@JsonSerializable()
class GovernorateResponse{
  final int id;
  final String name;
  bool? isSelected;
  GovernorateResponse({required this.id, required this.name});
  factory GovernorateResponse.fromJson(Map<String,dynamic> json)=> _$GovernorateResponseFromJson(json);
  Map<String,dynamic> toJson()=> _$GovernorateResponseToJson(this);

}