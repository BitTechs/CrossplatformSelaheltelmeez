import 'dart:convert';
import 'dart:io';
import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'package:selaheltelmeez/core/data_transfer_object/app_config.dart';

class DioClient
{
  static Future<Dio> getHttpClient() => Future<Dio>(() async {
    final dio = Dio();
    dio.options.connectTimeout = const Duration(seconds: 60).inMilliseconds;
    dio.options.sendTimeout = const Duration(seconds: 60).inMilliseconds;
    dio.options.receiveTimeout = const Duration(seconds: 60).inMilliseconds;
    dio.options.sendTimeout = const Duration(seconds: 60).inMilliseconds;
    dio.options.receiveTimeout = const Duration(seconds: 60).inMilliseconds;
    dio.options.validateStatus = (_) => true;
    dio.options.receiveDataWhenStatusError = true;
    dio.options.headers["Authorization"] = "Bearer eyJhbGciOiJodHRwOi8vd3d3LnczLm9yZy8yMDAxLzA0L3htbGRzaWctbW9yZSNobWFjLXNoYTI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJkNzA1ZDNiNy0xOTk1LTQ0MjMtYTIzZS0wOGRhMDczNzM5NzgiLCJqdGkiOiI5NjM4ZTQ0Zi0xOTM0LTQxNjktOGM1NS02OTFiODkxMjMwNDQiLCJuYmYiOjE2NDc0MjYyOTksImV4cCI6MTY1MjYxMDI5OSwiaXNzIjoiU1RJZGVudGl0eVNlcnZpY2VQcm92aWRlciIsImF1ZCI6IlNUSWRlbnRpdHlDb25zdW1lciJ9.dhgrC9CPX9AOI9XoaAplBzBXtFMl_fJYxHlhg-KKdOs";
    dio.options.baseUrl = AppConfig.fromJson(json.decode(await rootBundle.loadString('assets/config/app_config.json'))).baseUrl;
    dio.interceptors.add(
      LogInterceptor(
        request: true,
        requestBody: true,
        requestHeader: true,
        responseHeader: true,
        responseBody: true,
        error: true,
      ),
    );

  (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
  (HttpClient client) {
    client.badCertificateCallback =
    (X509Certificate cert, String host, int port) => true;
  };
    return dio;
  });
}