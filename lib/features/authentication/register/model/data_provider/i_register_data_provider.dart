import 'package:selaheltelmeez/core/data_transfer_object/value_commit_result.dart';
import 'package:selaheltelmeez/features/authentication/register/model/data_transfer_object/grade_menu_item.dart';
import 'package:selaheltelmeez/features/authentication/register/model/data_transfer_object/register_request.dart';
import 'package:selaheltelmeez/features/authentication/register/model/data_transfer_object/register_response.dart';

abstract class IRegisterDataProvider {
  Future<ValueCommitResult<RegisterResponse>> registerAsync(RegisterRequest request);

  Future<ValueCommitResult<List<GradeMenuItem>>> getGradeMenuItemsAsync();

}
