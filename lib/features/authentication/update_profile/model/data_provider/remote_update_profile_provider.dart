import 'package:dio/dio.dart';
import 'package:selaheltelmeez/core/data_transfer_object/value_commit_result.dart';
import 'package:selaheltelmeez/core/dio_client/dio_client.dart';
import 'package:selaheltelmeez/features/authentication/update_profile/model/data_transfer_object/avatar_response.dart';
import 'package:selaheltelmeez/features/authentication/update_profile/model/data_transfer_object/governorate_response.dart';

import 'package:selaheltelmeez/features/authentication/update_profile/model/data_transfer_object/update_profile_request.dart';

import 'package:selaheltelmeez/features/authentication/update_profile/model/data_transfer_object/update_profile_response.dart';

import 'i_update_profile_provider.dart';

class RemoteUpdateProfileProvider implements IUpdateProfileDataProvider{
  final IDioClient dioClient;
  RemoteUpdateProfileProvider({required this.dioClient});
  @override
  Future<ValueCommitResult<UpdateProfileResponse>> updateProfileAsync(UpdateProfileRequest request)async {
   Response<dynamic> response = await dioClient.getClient().post('/Identity/UpdateProfile', data: request);
   print(response);
   return ValueCommitResult<UpdateProfileResponse>.fromJson(response.data,(data)=> UpdateProfileResponse.fromJson(data as Map<String,dynamic>));
  }

  @override
  Future<ValueCommitResult<List<AvatarResponse>>> getAvatarsAsync()async {
    Response<dynamic> response = await dioClient.getClient().get('/Identity/GetAvatars');
    return ValueCommitResult<List<AvatarResponse>>.fromJson(response.data,(data)=> (data as List).map((e) => AvatarResponse.fromJson(e as Map<String,dynamic>)).toList());
  }

  @override
  Future<ValueCommitResult<List<GovernorateResponse>>> getGovernoratesAsync()async {
    Response<dynamic> response = await dioClient.getClient().get('/Identity/GetGovernorates');
    return ValueCommitResult<List<GovernorateResponse>>.fromJson(response.data,(data)=> (data as List).map((e) => GovernorateResponse.fromJson(e as Map<String,dynamic>)).toList());
  }

}