import 'package:selaheltelmeez/core/data_transfer_object/value_commit_result.dart';
import 'package:selaheltelmeez/src/data/authentication/data_providers/update_profile/remote_update_profile_data_provider.dart';
import 'package:selaheltelmeez/src/data/authentication/dtos/update_profile/avatar_response.dart';
import 'package:selaheltelmeez/src/data/authentication/dtos/update_profile/governorate_response.dart';
import 'package:selaheltelmeez/src/data/authentication/dtos/update_profile/update_profile_request.dart';
import 'package:selaheltelmeez/src/data/authentication/dtos/update_profile/update_profile_response.dart';


class UpdateProfileRepository{
  final RemoteUpdateProfileDataProvider dataProvider;
  UpdateProfileRepository({required this.dataProvider});

  Future<ValueCommitResult<UpdateProfileResponse>> updateProfileAsync(UpdateProfileRequest request)async => await dataProvider.updateProfileAsync(request);
  Future<ValueCommitResult<List<AvatarResponse>>> getAvatarsAsync()async => await dataProvider.getAvatarsAsync();
  Future<ValueCommitResult<List<GovernorateResponse>>> getGovernoratesAsync()async => await dataProvider.getGovernoratesAsync();
}