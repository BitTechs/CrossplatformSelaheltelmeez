import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:selaheltelmeez/src/data/student/dtos/invitations/identity_invitation_response.dart';
import 'package:selaheltelmeez/src/data/student/repositories/invitations/invitation_respository.dart';

part 'invitation_state.dart';

class InvitationCubit extends Cubit<InvitationState> {

  final InvitationRepository _repo;
  InvitationCubit(this._repo) : super(InvitationInitial());

  Future<void> loadInvitationAsync()async{
    emit(InvitationLoading());
    final response = await _repo.getInvitationsAsync();
    if(response.isSuccess){
      if(response.value?.isNotEmpty ?? false){
        emit(InvitationSuccess(response.value!));
      }else{
        emit(InvitationEmpty());
      }
    }else{
      emit(InvitationFailed(response.errorMessage ?? "Error"));
    }
  }
}
