import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:selaheltelmeez/core/data_transfer_object/commit_result.dart';
import 'package:selaheltelmeez/core/local_storage/app_user_local_storage_provider.dart';
import 'package:selaheltelmeez/features/authentication/change_email_or_mobile/model/data_transfer_object/change_email_or_mobile_request.dart';
import 'package:selaheltelmeez/features/authentication/change_email_or_mobile/model/repository/change_email_or_mobile_repository.dart';

part 'change_email_or_mobile_state.dart';

class ChangeEmailOrMobileCubit extends Cubit<ChangeEmailOrMobileState> {
  final ChangeEmailOrMobileRepository _repo;
  ChangeEmailOrMobileCubit(this._repo) : super(ChangeEmailOrMobileInitial());

  Future<void> updateAsync(ChangeEmailOrMobileRequest request) async {
    emit(ChangeEmailOrMobileSubmit());
    CommitResult response = await _repo.updateAsync(request);
    if (response.isSuccess) {
      Map<String, dynamic> appUserEntityMappedJson =  await AppUserLocalStorageProvider.readAsJsonAsync();
      appUserEntityMappedJson['email'] = request.newEmail;
      appUserEntityMappedJson['mobileNumber'] = request.newMobileNumber;
      await AppUserLocalStorageProvider.addAsJsonAsync(appUserEntityMappedJson);
      emit(ChangeEmailOrMobileSuccess());
    } else {
      emit(ChangeEmailOrMobileFailed(
          errorMessage: response.errorMessage ?? "Error"));
    }
  }
}
