import 'package:selaheltelmeez/core/data_transfer_object/value_commit_result.dart';
import 'package:selaheltelmeez/features/authentication/login/model/data_provider/login_data_provider.dart';
import 'package:selaheltelmeez/features/authentication/login/model/data_transfer_object/login_request.dart';
import 'package:selaheltelmeez/features/authentication/login/model/data_transfer_object/login_response.dart';


// Only Costumes whatever implementation is sent as a data provider.
class LoginRepository {
  final ILoginDataProvider dataProvider;
  LoginRepository({required this.dataProvider});
  Future<ValueCommitResult<LoginResponse>> loginAsync(LoginRequest request) async => await dataProvider.loginAsync(request);
}
