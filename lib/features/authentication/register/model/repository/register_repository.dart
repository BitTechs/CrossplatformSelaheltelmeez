// The repository layer is a wrapper around one or more data providers with which the Bloc Layer communicates.

import 'package:selaheltelmeez/core/data_transfer_object/value_commit_result.dart';
import 'package:selaheltelmeez/features/authentication/register/model/data_provider/i_register_data_provider.dart';
import 'package:selaheltelmeez/features/authentication/register/model/data_transfer_object/grade_menu_item.dart';
import 'package:selaheltelmeez/features/authentication/register/model/data_transfer_object/register_request.dart';
import 'package:selaheltelmeez/features/authentication/register/model/data_transfer_object/register_response.dart';

class RegisterRepository {
  final IRegisterDataProvider dataProvider;
  RegisterRepository({required this.dataProvider});
  Future<ValueCommitResult<RegisterResponse>> registerAsync(RegisterRequest request) async => await dataProvider.registerAsync(request);
  Future<ValueCommitResult<List<GradeMenuItem>>> getGradeMenuItemsAsync() async => await dataProvider.getGradeMenuItemsAsync();
}
