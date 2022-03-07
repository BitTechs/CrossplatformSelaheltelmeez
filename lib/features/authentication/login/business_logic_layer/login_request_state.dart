import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:selaheltelmeez/core/data_transfer_object/value_commit_result.dart';
import 'package:selaheltelmeez/features/authentication/login/data_access_layer/data_transfer_object/login_request.dart';
import 'package:selaheltelmeez/features/authentication/login/data_access_layer/data_transfer_object/login_response.dart';
import 'package:selaheltelmeez/features/authentication/login/data_access_layer/repository/login_repository.dart';

class LoginRequestState extends StateNotifier<LoginRequest> {
  LoginRequestState() : super(LoginRequest());
  Future<ValueCommitResult<LoginResponse>> loginAsync(LoginRequest request) async => await LoginRepository().loginAsync(request);
}
