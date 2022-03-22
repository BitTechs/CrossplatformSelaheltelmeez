import 'package:dio/dio.dart';
import 'package:selaheltelmeez/core/data_transfer_object/commit_result.dart';
import 'package:selaheltelmeez/core/dio_client/dio_client.dart';
import 'package:selaheltelmeez/src/data/authentication/dtos/change_email_or_mobile/change_email_or_mobile_request.dart';

class RemoteChangeEmailOrMobileDataProvider {
  final IDioClient dioClient;
  RemoteChangeEmailOrMobileDataProvider({required this.dioClient});

  Future<CommitResult> updateAsync(ChangeEmailOrMobileRequest request) async {
    Response<dynamic> response = await dioClient.getClient().post("/Identity/ChangeEmailOrMobile", data: request);
    return CommitResult.fromJson(response.data);
  }

}