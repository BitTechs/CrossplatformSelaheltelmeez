
import 'package:dio/dio.dart';
import 'package:selaheltelmeez/core/data_transfer_object/value_commit_result.dart';
import 'package:selaheltelmeez/core/dio_client/dio_client.dart';
import 'package:selaheltelmeez/src/data/student/dtos/game_object_activity/activity_request.dart';

class GameObjectActivityDataProvider{
  final IDioClient dioClient;
  GameObjectActivityDataProvider({required this.dioClient});

  Future<ValueCommitResult<int>> insertActivity(ActivityRequest request)async{
    Response<dynamic> response = await dioClient.getClient().post("/StudentActivityTracker/InsertStudentActivity", data: request);
    return ValueCommitResult<int>.fromJson(response.data,(data)=> data as int);
  }
}