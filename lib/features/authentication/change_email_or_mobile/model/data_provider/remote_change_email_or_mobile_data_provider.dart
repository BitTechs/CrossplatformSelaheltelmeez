import 'package:dio/dio.dart';
import 'package:selaheltelmeez/core/data_transfer_object/commit_result.dart';
import 'package:selaheltelmeez/core/dio_client/dio_client.dart';
import 'package:selaheltelmeez/features/authentication/change_email_or_mobile/model/data_provider/i_change_email_or_mobile_data_provider.dart';
import 'package:selaheltelmeez/features/authentication/change_email_or_mobile/model/data_transfer_object/change_email_or_mobile_request.dart';

class RemoteChangeEmailOrMobileDataProvider implements IChangeEmailOrMobileDataProvider{
  final IDioClient dioClient;
  RemoteChangeEmailOrMobileDataProvider({required this.dioClient});
  @override
  Future<CommitResult> updateAsync(ChangeEmailOrMobileRequest request) async {
    Response<dynamic> response = await dioClient.getClient().post("/Identity/ChangeEmailOrMobile", data: request);
    return CommitResult.fromJson(response.data);
  }

}