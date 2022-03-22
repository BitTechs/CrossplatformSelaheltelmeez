// Only Costumes whatever implementation is sent as a data provider.
import 'package:selaheltelmeez/core/data_transfer_object/commit_result.dart';
import 'package:selaheltelmeez/src/data/authentication/data_providers/change_email_or_mobile/remote_change_email_or_mobile_data_provider.dart';
import 'package:selaheltelmeez/src/data/authentication/dtos/change_email_or_mobile/change_email_or_mobile_request.dart';

class ChangeEmailOrMobileRepository {
  final RemoteChangeEmailOrMobileDataProvider dataProvider;
  ChangeEmailOrMobileRepository({required this.dataProvider});
  Future<CommitResult> updateAsync(ChangeEmailOrMobileRequest request) async => await dataProvider.updateAsync(request);
}
