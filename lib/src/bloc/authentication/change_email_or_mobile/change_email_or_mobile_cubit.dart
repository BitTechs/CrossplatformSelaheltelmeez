import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:selaheltelmeez/core/data_transfer_object/commit_result.dart';
import 'package:selaheltelmeez/src/data/authentication/dtos/change_email_or_mobile/change_email_or_mobile_request.dart';
import 'package:selaheltelmeez/src/data/authentication/repositories/change_email_or_mobile/change_email_or_mobile_repository.dart';

part 'change_email_or_mobile_state.dart';

class ChangeEmailOrMobileCubit extends Cubit<ChangeEmailOrMobileState> {
  final ChangeEmailOrMobileRepository _repo;
  ChangeEmailOrMobileCubit(this._repo) : super(ChangeEmailOrMobileInitial());

  Future<void> updateAsync(ChangeEmailOrMobileRequest request) async {
    emit(ChangeEmailOrMobileSubmit());
    CommitResult response = await _repo.updateAsync(request);
    if (response.isSuccess) {

      emit(ChangeEmailOrMobileSuccess());
    } else {
      emit(ChangeEmailOrMobileFailed(
          errorMessage: response.errorMessage ?? "Error"));
    }
  }
}
