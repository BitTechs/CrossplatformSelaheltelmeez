import 'package:dio/dio.dart';
import 'package:selaheltelmeez/core/data_transfer_object/value_commit_result.dart';
import 'package:selaheltelmeez/core/dio_client/dio_client.dart';
import 'package:selaheltelmeez/features/authentication/register/model/data_provider/i_register_data_provider.dart';
import 'package:selaheltelmeez/features/authentication/register/model/data_transfer_object/grade_menu_item.dart';
import 'package:selaheltelmeez/features/authentication/register/model/data_transfer_object/register_request.dart';
import 'package:selaheltelmeez/features/authentication/register/model/data_transfer_object/register_response.dart';

class RemoteRegisterDataProvider implements IRegisterDataProvider{
  final IDioClient dioClient;
  RemoteRegisterDataProvider({required this.dioClient});
  @override
  Future<ValueCommitResult<List<GradeMenuItem>>> getGradeMenuItemsAsync() async {
    Response<dynamic> response = await dioClient.getClient().get("/Identity/GetGradesDropDownMenu");
    return ValueCommitResult<List<GradeMenuItem>>.fromJson(response.data,(data)=> (data as List).map((e) => GradeMenuItem.fromJson(e as Map<String,dynamic>)).toList());
  }
  @override
  Future<ValueCommitResult<RegisterResponse>> registerAsync(RegisterRequest request) async {
    Response<dynamic> response = await dioClient.getClient().post("/Identity/Register", data: request);
    return ValueCommitResult<RegisterResponse>.fromJson(response.data,(data)=> RegisterResponse.fromJson(data as Map<String,dynamic>));
  }
}