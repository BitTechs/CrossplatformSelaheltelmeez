import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:selaheltelmeez/features/authentication/login/data_access_layer/data_transfer_object/advanced_user_profile_commit_result.dart';
import 'package:selaheltelmeez/features/authentication/login/data_access_layer/data_transfer_object/login_user.dart';
import 'package:selaheltelmeez/features/authentication/login/data_access_layer/repository/login_repository.dart';
import 'package:selaheltelmeez/features/authentication/register/data_access_layer/data_transfer_object/register_user.dart';
import 'package:selaheltelmeez/features/authentication/register/data_access_layer/repository/register_repository.dart';

class RegisterRequestState extends StateNotifier<RegisterUser> {
  RegisterRequestState() : super(RegisterUser());
  Future<AdvancedUserProfileCommitResult> registerAsync(RegisterUser request) async => await RegisterRepository().registerAsync(request);
}
