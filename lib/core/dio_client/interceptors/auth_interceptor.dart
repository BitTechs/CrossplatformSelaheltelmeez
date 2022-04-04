import 'package:dio/dio.dart';
import 'package:selaheltelmeez/core/local_storage/repositories/app_user_repository.dart';

class AuthInterceptor extends Interceptor {
  final AppUserRepository _repository;
  AuthInterceptor(this._repository);

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) async {

    final appUserEntity =  _repository.getAppUser();
    if(appUserEntity != null){
      options.headers["Authorization"] = "Bearer ${appUserEntity.accessToken ?? ""}";
    }
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
