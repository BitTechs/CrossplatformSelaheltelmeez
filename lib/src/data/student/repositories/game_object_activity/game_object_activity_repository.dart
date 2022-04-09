import 'package:selaheltelmeez/core/data_transfer_object/commit_result.dart';
import 'package:selaheltelmeez/core/data_transfer_object/value_commit_result.dart';
import 'package:selaheltelmeez/src/data/student/data_provider/game_object_activity/game_object_activity_data_provider.dart';
import 'package:selaheltelmeez/src/data/student/dtos/game_object_activity/activity_request.dart';
import 'package:selaheltelmeez/src/data/student/dtos/game_object_activity/update_activity_request.dart';

class GameObjectActivityRepository{
  final GameObjectActivityDataProvider dataProvider;
  GameObjectActivityRepository({required this.dataProvider});
  Future<ValueCommitResult<int>> insertActivityAsync(ActivityRequest request)async => await dataProvider.insertActivityAsync(request);
  Future<CommitResult> updateActivityAsync(UpdateActivityRequest request)async => await dataProvider.updateActivityAsync(request);
}