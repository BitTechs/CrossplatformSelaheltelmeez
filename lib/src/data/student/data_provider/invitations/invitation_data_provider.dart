import 'package:dio/dio.dart';
import 'package:selaheltelmeez/core/data_transfer_object/value_commit_result.dart';
import 'package:selaheltelmeez/core/dio_client/dio_client.dart';
import 'package:selaheltelmeez/src/data/student/dtos/invitations/identity_invitation_response.dart';

class InvitationDataProvider{
  final IDioClient dioClient;
  InvitationDataProvider({required this.dioClient});

  Future<ValueCommitResult<List<IdentityInvitationResponse>>> getInvitationsAsync()async{
    Response<dynamic> response = await dioClient.getClient().get("/StudentActivityTracker/GetIdentityInvitations");
    return ValueCommitResult<List<IdentityInvitationResponse>>.fromJson(response.data,(data) => (data as List).map((e) => IdentityInvitationResponse.fromJson(e as Map<String,dynamic>)).toList());
  }
}