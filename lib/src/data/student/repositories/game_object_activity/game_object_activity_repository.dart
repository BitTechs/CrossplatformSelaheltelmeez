import 'package:selaheltelmeez/core/data_transfer_object/value_commit_result.dart';
import 'package:selaheltelmeez/src/data/student/data_provider/game_object_activity/game_object_activity_data_provider.dart';
import 'package:selaheltelmeez/src/data/student/dtos/game_object_activity/activity_request.dart';

class GameObjectActivityRepository{
  final GameObjectActivityDataProvider dataProvider;
  GameObjectActivityRepository({required this.dataProvider});
  Future<ValueCommitResult<int>> insertActivity(ActivityRequest request)async => await dataProvider.insertActivity(request);
}