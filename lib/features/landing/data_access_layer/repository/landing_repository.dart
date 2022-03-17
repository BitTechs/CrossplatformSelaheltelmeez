import 'package:dio/dio.dart';
import 'package:selaheltelmeez/core/dio_client/dio_client.dart';
import 'package:selaheltelmeez/features/landing/data_access_layer/data_transfer_object/landing_section_commit_result.dart';

/*
class LandingRepository {
  Future<LandingSectionCommitResult> getLandingSectionsAsync() async {
    Dio dioClient = await DioClient.getAnonymousHttpClient();
    Response<dynamic> responseResult =
        await dioClient.get("/Landing/GetSections");
    return LandingSectionCommitResult.fromJson(responseResult.data);
  }
}
*/
