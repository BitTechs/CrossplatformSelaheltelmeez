import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:selaheltelmeez/core/data_transfer_object/commit_result.dart';
import 'package:selaheltelmeez/core/data_transfer_object/remote_validation_error_reponse.dart';
import 'package:selaheltelmeez/core/dio_client/dio_client.dart';
import 'package:selaheltelmeez/features/authentication/login/data_access_layer/data_transfer_object/advanced_user_profile.dart';
import 'package:selaheltelmeez/features/authentication/login/data_access_layer/data_transfer_object/advanced_user_profile_commit_result.dart';
import 'package:selaheltelmeez/features/authentication/login/data_access_layer/data_transfer_object/login_user.dart';

class LoginRepository {
  Future<AdvancedUserProfileCommitResult> loginAsync(LoginUser request) async {
    Dio dioClient = await DioClient.getHttpClient();
    Response<dynamic> responseResult = await dioClient.post("/Auth/Login", data: request);
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
