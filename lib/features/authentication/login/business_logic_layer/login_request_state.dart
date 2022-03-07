import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:selaheltelmeez/features/authentication/login/data_access_layer/data_transfer_object/advanced_user_profile_commit_result.dart';
import 'package:selaheltelmeez/features/authentication/login/data_access_layer/data_transfer_object/login_user.dart';
import 'package:selaheltelmeez/features/authentication/login/data_access_layer/repository/login_repository.dart';

class LoginRequestState extends StateNotifier<LoginUser> {
  LoginRequestState() : super(LoginUser());
  Future<AdvancedUserProfileCommitResult> loginAsync(LoginUser request) async => await LoginRepository().loginAsync(request);
}
