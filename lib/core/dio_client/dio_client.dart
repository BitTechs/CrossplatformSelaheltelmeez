import 'dart:convert';
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
    dio.options.baseUrl = AppConfig.fromJson(json.decode(await rootBundle.loadString('assets/config/app_config.json'))).baseUrl!;
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
    return dio;
  });
}