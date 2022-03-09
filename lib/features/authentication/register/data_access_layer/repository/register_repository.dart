import 'package:dio/dio.dart';
import 'package:selaheltelmeez/core/dio_client/dio_client.dart';
import 'package:selaheltelmeez/features/authentication/login/data_access_layer/data_transfer_object/advanced_user_profile_commit_result.dart';
import 'package:selaheltelmeez/features/authentication/register/data_access_layer/data_transfer_object/register_user.dart';

class RegisterRepository {
  Future<AdvancedUserProfileCommitResult> registerAsync(RegisterUser request) async {
    Dio dioClient = await DioClient.getHttpClient();
    Response<dynamic> responseResult = await dioClient.post("/Auth/Register", data: request);
    if(responseResult.statusCode == 403){
      return AdvancedUserProfileCommitResult()
              ..errorMessage = responseResult.data[0]['ErrorMessage']
              ..errorCode = 403
              ..isSuccess = false;
    }
    if(responseResult.statusCode == 400){
      final validationErrorResponse = responseResult.data.toString();
      return AdvancedUserProfileCommitResult()
        ..errorMessage = validationErrorResponse
        ..errorCode = 400
        ..isSuccess = false;
    }
    return AdvancedUserProfileCommitResult.fromJson(responseResult.data);
  }
}
