import 'package:dio/dio.dart';
import 'package:selaheltelmeez/core/data_transfer_object/value_commit_result.dart';
import 'package:selaheltelmeez/core/dio_client/dio_client.dart';
import 'package:selaheltelmeez/src/data/authentication/dtos/register/grade_menu_item.dart';
import 'package:selaheltelmeez/src/data/authentication/dtos/register/register_request.dart';
import 'package:selaheltelmeez/src/data/authentication/dtos/register/register_response.dart';

class RemoteRegisterDataProvider {
  final IDioClient dioClient;
  RemoteRegisterDataProvider({required this.dioClient});
  Future<ValueCommitResult<List<GradeMenuItem>>> getGradeMenuItemsAsync() async {
    Response<dynamic> response = await dioClient.getClient().get("/provider/GetGradesDropDownMenu");
    return ValueCommitResult<List<GradeMenuItem>>.fromJson(response.data,(data)=> (data as List).map((e) => GradeMenuItem.fromJson(e as Map<String,dynamic>)).toList());
  }
  Future<ValueCommitResult<RegisterResponse>> registerAsync(RegisterRequest request) async {
    Response<dynamic> response = await dioClient.getClient().post("/Identity/Register", data: request);
    return ValueCommitResult<RegisterResponse>.fromJson(response.data,(data)=> RegisterResponse.fromJson(data as Map<String,dynamic>));
  }
}