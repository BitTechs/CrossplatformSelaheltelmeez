import 'dart:io';
import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:selaheltelmeez/core/dio_client/interceptors/auth_interceptor.dart';
import 'package:selaheltelmeez/core/local_storage/repositories/app_user_repository.dart';

abstract class IDioClient {
  Dio getClient();
}
class AnonymousDioClient implements IDioClient {
  @override
  Dio getClient() {
    final Dio _dio = Dio(BaseOptions(
        connectTimeout: const Duration(seconds: 60).inMilliseconds,
        sendTimeout: const Duration(seconds: 60).inMilliseconds,
        receiveTimeout: const Duration(seconds: 60).inMilliseconds,
        validateStatus: (_) => true,
        receiveDataWhenStatusError: true,
        headers: {
          'Accept-Language': 'ar-EG',
        },
        baseUrl: 'https://10.0.2.2:7228'));

    _dio.interceptors.add(
      LogInterceptor(
        request: true,
        requestBody: true,
        requestHeader: true,
        responseHeader: true,
        responseBody: true,
        error: true,
      ),
    );
    (_dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
        (HttpClient client) {
      client.badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
    };
    return _dio;
  }
}
class AuthorizedDioClient implements IDioClient {
  final AppUserRepository appUserRepository;
  AuthorizedDioClient({required this.appUserRepository});

  @override
  Dio getClient() {
    final _dio = Dio(BaseOptions(
        connectTimeout: const Duration(seconds: 60).inMilliseconds,
        sendTimeout: const Duration(seconds: 60).inMilliseconds,
        receiveTimeout: const Duration(seconds: 60).inMilliseconds,
        validateStatus: (_) => true,
        receiveDataWhenStatusError: true,
        headers: {
          'Accept-Language': 'ar-EG',
        },
        baseUrl: 'https://10.0.2.2:7228'));

    _dio.interceptors.add(
      LogInterceptor(
        request: true,
        requestBody: true,
        requestHeader: true,
        responseHeader: true,
        responseBody: true,
        error: true,
      ),
    );

    _dio.interceptors.add(AuthInterceptor(appUserRepository));

    (_dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
        (HttpClient client) {
      client.badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
    };
    return _dio;
  }
}
