import 'package:dio/dio.dart';
import 'package:selaheltelmeez/core/data_transfer_object/value_commit_result.dart';
import 'package:selaheltelmeez/features/authentication/register/model/data_provider/register_data_provider.dart';
import 'package:selaheltelmeez/features/authentication/register/model/data_transfer_object/grade_menu_item.dart';
import 'package:selaheltelmeez/features/authentication/register/model/data_transfer_object/register_request.dart';
import 'package:selaheltelmeez/features/authentication/register/model/data_transfer_object/register_response.dart';

class RegisterRepository {
  final RegisterDataProvider dataProvider;
  RegisterRepository({required this.dataProvider});

  Future<ValueCommitResult<RegisterResponse>> registerAsync(RegisterRequest request) async {
  Response<dynamic> responseResult = await dataProvider.registerAsync(request);
  return ValueCommitResult<RegisterResponse>.fromJson(responseResult.data,(data)=> RegisterResponse.fromJson(data as Map<String,dynamic>));
  }

  Future<ValueCommitResult<List<GradeMenuItem>>> getGradeMenuItemsAsync() async {
    Response<dynamic> responseResult = await dataProvider.getGradesMenuItemAsync();
    return ValueCommitResult<List<GradeMenuItem>>.fromJson(responseResult.data,(data)=> (data as List).map((e) => GradeMenuItem.fromJson(e as Map<String,dynamic>)).toList());
  }

}
