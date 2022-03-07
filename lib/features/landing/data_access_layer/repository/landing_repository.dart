import 'package:dio/dio.dart';
import 'package:selaheltelmeez/core/data_transfer_object/value_commit_result.dart';
import 'package:selaheltelmeez/core/dio_client/dio_client.dart';
import 'package:selaheltelmeez/features/landing/data_access_layer/data_transfer_object/landing_section.dart';

class LandingRepository {
  Future<ValueCommitResult<LandingSection>> getLandingSectionsAsync() async {
    Dio dioClient = await DioClient.getHttpClient();
    Response<dynamic> responseResult =
        await dioClient.get("/Landing/GetSections");
    return ValueCommitResult<LandingSection>.fromJson(responseResult.data, (json)=> LandingSection.fromJson(json));
  }
}
