import 'package:dio/dio.dart';
import 'package:selaheltelmeez/core/data_transfer_object/value_commit_result.dart';
import 'package:selaheltelmeez/core/dio_client/dio_client.dart';
import 'package:selaheltelmeez/src/data/authentication/dtos/update_profile/avatar_response.dart';
import 'package:selaheltelmeez/src/data/authentication/dtos/update_profile/governorate_response.dart';
import 'package:selaheltelmeez/src/data/authentication/dtos/update_profile/update_profile_request.dart';
import 'package:selaheltelmeez/src/data/authentication/dtos/update_profile/update_profile_response.dart';

class RemoteUpdateProfileDataProvider{
  final IDioClient dioClient;
  RemoteUpdateProfileDataProvider({required this.dioClient});
  Future<ValueCommitResult<UpdateProfileResponse>> updateProfileAsync(UpdateProfileRequest request)async {
   Response<dynamic> response = await dioClient.getClient().post('/Identity/UpdateProfile', data: request);
   return ValueCommitResult<UpdateProfileResponse>.fromJson(response.data,(data)=> UpdateProfileResponse.fromJson(data as Map<String,dynamic>));
  }

  Future<ValueCommitResult<List<AvatarResponse>>> getAvatarsAsync()async {
    Response<dynamic> response = await dioClient.getClient().get('/provider/GetAvatars');
    return ValueCommitResult<List<AvatarResponse>>.fromJson(response.data,(data)=> (data as List).map((e) => AvatarResponse.fromJson(e as Map<String,dynamic>)).toList());
  }

  Future<ValueCommitResult<List<GovernorateResponse>>> getGovernoratesAsync()async {
    Response<dynamic> response = await dioClient.getClient().get('/provider/GetGovernorates');
    return ValueCommitResult<List<GovernorateResponse>>.fromJson(response.data,(data)=> (data as List).map((e) => GovernorateResponse.fromJson(e as Map<String,dynamic>)).toList());
  }

}