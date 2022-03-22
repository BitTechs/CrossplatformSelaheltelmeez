// The repository layer is a wrapper around one or more data providers with which the Bloc Layer communicates.

import 'package:selaheltelmeez/core/data_transfer_object/value_commit_result.dart';
import 'package:selaheltelmeez/src/data/authentication/data_providers/register/register_data_provider.dart';
import 'package:selaheltelmeez/src/data/authentication/dtos/register/grade_menu_item.dart';
import 'package:selaheltelmeez/src/data/authentication/dtos/register/register_request.dart';
import 'package:selaheltelmeez/src/data/authentication/dtos/register/register_response.dart';

class RegisterRepository {
  final RemoteRegisterDataProvider dataProvider;
  RegisterRepository({required this.dataProvider});
  Future<ValueCommitResult<RegisterResponse>> registerAsync(RegisterRequest request) async => await dataProvider.registerAsync(request);
  Future<ValueCommitResult<List<GradeMenuItem>>> getGradeMenuItemsAsync() async => await dataProvider.getGradeMenuItemsAsync();
}
