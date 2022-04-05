import 'package:selaheltelmeez/core/data_transfer_object/value_commit_result.dart';
import 'package:selaheltelmeez/src/data/student/data_provider/invitations/invitation_data_provider.dart';
import 'package:selaheltelmeez/src/data/student/dtos/invitations/identity_invitation_response.dart';

class InvitationRepository{
  final InvitationDataProvider dataProvider;
  InvitationRepository({required this.dataProvider});
  Future<ValueCommitResult<List<IdentityInvitationResponse>>> getInvitationsAsync()async => await dataProvider.getInvitationsAsync();
}