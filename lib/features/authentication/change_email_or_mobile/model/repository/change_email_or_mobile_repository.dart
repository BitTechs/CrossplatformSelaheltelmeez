// Only Costumes whatever implementation is sent as a data provider.
import 'package:selaheltelmeez/core/data_transfer_object/commit_result.dart';
import 'package:selaheltelmeez/features/authentication/change_email_or_mobile/model/data_provider/i_change_email_or_mobile_data_provider.dart';
import 'package:selaheltelmeez/features/authentication/change_email_or_mobile/model/data_transfer_object/change_email_or_mobile_request.dart';

class ChangeEmailOrMobileRepository {
  final IChangeEmailOrMobileDataProvider dataProvider;
  ChangeEmailOrMobileRepository({required this.dataProvider});
  Future<CommitResult> updateAsync(ChangeEmailOrMobileRequest request) async => await dataProvider.updateAsync(request);
}
