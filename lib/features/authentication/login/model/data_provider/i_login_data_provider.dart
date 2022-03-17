import 'package:selaheltelmeez/core/data_transfer_object/value_commit_result.dart';
import 'package:selaheltelmeez/features/authentication/login/model/data_transfer_object/login_request.dart';
import 'package:selaheltelmeez/features/authentication/login/model/data_transfer_object/login_response.dart';

abstract class ILoginDataProvider {
  Future<ValueCommitResult<LoginResponse>> loginAsync(LoginRequest request);
}
