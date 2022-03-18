import 'package:selaheltelmeez/core/data_transfer_object/value_commit_result.dart';
import 'package:selaheltelmeez/features/authentication/update_profile/model/data_transfer_object/avatar_response.dart';
import 'package:selaheltelmeez/features/authentication/update_profile/model/data_transfer_object/governorate_response.dart';
import 'package:selaheltelmeez/features/authentication/update_profile/model/data_transfer_object/update_profile_request.dart';
import 'package:selaheltelmeez/features/authentication/update_profile/model/data_transfer_object/update_profile_response.dart';

abstract class IUpdateProfileDataProvider {
  Future<ValueCommitResult<UpdateProfileResponse>> updateProfileAsync(UpdateProfileRequest request);
  Future<ValueCommitResult<List<AvatarResponse>>> getAvatarsAsync();
  Future<ValueCommitResult<List<GovernorateResponse>>> getGovernoratesAsync();

}
