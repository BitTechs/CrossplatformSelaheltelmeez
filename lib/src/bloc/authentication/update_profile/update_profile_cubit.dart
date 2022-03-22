import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:selaheltelmeez/core/local_storage/app_user_local_storage_provider.dart';
import 'package:selaheltelmeez/src/data/authentication/dtos/update_profile/avatar_response.dart';
import 'package:selaheltelmeez/src/data/authentication/dtos/update_profile/governorate_response.dart';
import 'package:selaheltelmeez/src/data/authentication/dtos/update_profile/update_profile_request.dart';
import 'package:selaheltelmeez/src/data/authentication/repositories/update_profile/update_profile_repository.dart';


part 'update_profile_state.dart';

class UpdateProfileCubit extends Cubit<UpdateProfileState> {
  final UpdateProfileRepository _repo;
  UpdateProfileCubit(this._repo) : super(UpdateProfileInitial());

  static UpdateProfileCubit get(context) => BlocProvider.of(context);

  final List<AvatarResponse> avatars = [];
  final List<GovernorateResponse> governorates = [];
  AvatarResponse? selectedAvatar;
  GovernorateResponse? selectedGovernorate;
  String? selectedBirthYear;

  late String gender = "";
  late bool liveInEgypt = false;


  Future<void> updateProfileAsync()async{
    emit(UpdateProfileSubmit());
    final response =  await _repo.updateProfileAsync(UpdateProfileRequest(
        dateOfBirth: selectedBirthYear,
        avatarId: selectedAvatar?.id,
        countryId: liveInEgypt? 1 : 0,
        governorateId: selectedGovernorate?.id,
        gender: gender == "male" ? 1 : 0,
        isEmailSubscribed: false));
    if(response.isSuccess){
      await AppUserLocalStorageProvider.addUpdateProfileResponseAsync(response.value!);
      emit(UpdateProfileSuccess());
    }else{
      emit(UpdateProfileFailed(errorMessage: response.errorMessage ?? "Error"));
    }
  }

  Future<void> loadAvatars()async{
    emit(UpdateProfileLoadAvatarsSubmit());
    final response = await _repo.getAvatarsAsync();
    if(response.isSuccess){
      avatars.addAll(response.value!);
      emit(UpdateProfileLoadAvatarsSuccess());
    }
    emit(UpdateProfileLoadAvatarsFailed(errorMessage: response.errorMessage ?? "Error"));
  }
  Future<void> loadGovernorates()async{
    emit(UpdateProfileLoadGovernoratesSubmit());
    final response = await _repo.getGovernoratesAsync();
    if(response.isSuccess){
      governorates.addAll(response.value!);
      emit(UpdateProfileLoadGovernoratesSuccess());
    }
    emit(UpdateProfileLoadGovernoratesFailed(errorMessage: response.errorMessage ?? "Error"));
  }
  void changeCountry(){
    liveInEgypt = !liveInEgypt;
    if(governorates.isEmpty){
      loadGovernorates();
    }
    if(!liveInEgypt){
      selectedGovernorate = null;
    }
    emit(UpdateProfileSelectCountryChange());
  }
  void changeGender(String _gender){
    gender = _gender;
    // calling emit will update causing the cubit instance to be updated.
    emit(UpdateProfileSelectGenderChange());
  }
  void changeAvatar(int index){
    avatars.where((element) => element.isSelected ?? false).forEach((element) {element.isSelected = false;});
    selectedAvatar = avatars[index];
    selectedAvatar?.isSelected = true;
    emit(UpdateProfileSelectAvatarChange());
  }
  void selectGovernorate(GovernorateResponse? selectedItem){
    selectedGovernorate = selectedItem;
  }
  void changeBirthOfYear(String selectedItem){
    selectedBirthYear = DateTime(int.parse(selectedItem),1,1).toString();
  }
}
