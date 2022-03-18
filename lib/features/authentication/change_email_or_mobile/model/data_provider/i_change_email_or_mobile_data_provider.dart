import 'package:selaheltelmeez/core/data_transfer_object/commit_result.dart';
import 'package:selaheltelmeez/features/authentication/change_email_or_mobile/model/data_transfer_object/change_email_or_mobile_request.dart';

abstract class IChangeEmailOrMobileDataProvider{
  Future<CommitResult> updateAsync(ChangeEmailOrMobileRequest request);

}