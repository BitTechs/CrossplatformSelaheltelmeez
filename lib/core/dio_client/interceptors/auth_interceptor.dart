import 'package:dio/dio.dart';
import 'package:selaheltelmeez/core/local_storage/app_user_entity.dart';
import 'package:selaheltelmeez/core/local_storage/app_user_local_storage_provider.dart';

class AuthInterceptor extends Interceptor {
  AuthInterceptor();

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    AppUserEntity appUserEntity =  await AppUserLocalStorageProvider.readAsAppUserObjectAsync();
    options.headers["Authorization"] = "Bearer ${appUserEntity.accessToken}";
    return handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) async {
    if (response.statusCode == 423) {
      //TODO: notify user ?
      return handler.reject(
        DioError(requestOptions: response.requestOptions, response: response),
      );
    }

    if (response.statusCode != 401) {
      //TODO: more handling for non 401 status code
      return handler.next(response);
    }
    if (response.statusCode == 401) {

      return handler.next(response);
    }
    return handler.next(response);
  }
  @override
  void onError(DioError err, ErrorInterceptorHandler handler) async {
    return handler.next(err);
  }
}
