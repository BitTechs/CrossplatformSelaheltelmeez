import 'package:selaheltelmeez/core/data_transfer_object/value_commit_result.dart';
import 'package:selaheltelmeez/src/data/authentication/data_providers/login/remote_login_data_provider.dart';
import 'package:selaheltelmeez/src/data/authentication/dtos/login/login_request.dart';
import 'package:selaheltelmeez/src/data/authentication/dtos/login/login_response.dart';


// Only Costumes whatever implementation is sent as a data provider.
class LoginRepository {
  final RemoteLoginDataProvider dataProvider;
  LoginRepository({required this.dataProvider});
  Future<ValueCommitResult<LoginResponse>> loginAsync(LoginRequest request) async => await dataProvider.loginAsync(request);
}
