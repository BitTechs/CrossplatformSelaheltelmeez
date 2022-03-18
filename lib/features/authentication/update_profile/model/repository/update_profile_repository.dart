import 'package:selaheltelmeez/core/data_transfer_object/value_commit_result.dart';
import 'package:selaheltelmeez/features/authentication/update_profile/model/data_provider/i_update_profile_provider.dart';
import 'package:selaheltelmeez/features/authentication/update_profile/model/data_transfer_object/avatar_response.dart';
import 'package:selaheltelmeez/features/authentication/update_profile/model/data_transfer_object/governorate_response.dart';
import 'package:selaheltelmeez/features/authentication/update_profile/model/data_transfer_object/update_profile_request.dart';
import 'package:selaheltelmeez/features/authentication/update_profile/model/data_transfer_object/update_profile_response.dart';

class UpdateProfileRepository{
  final IUpdateProfileDataProvider dataProvider;
  UpdateProfileRepository({required this.dataProvider});

  Future<ValueCommitResult<UpdateProfileResponse>> updateProfileAsync(UpdateProfileRequest request)async => await dataProvider.updateProfileAsync(request);
  Future<ValueCommitResult<List<AvatarResponse>>> getAvatarsAsync()async => await dataProvider.getAvatarsAsync();
  Future<ValueCommitResult<List<GovernorateResponse>>> getGovernoratesAsync()async => await dataProvider.getGovernoratesAsync();
}