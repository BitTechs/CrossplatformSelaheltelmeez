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
    dio.options.headers["Authorization"] = "Bearer eyJhbGciOiJodHRwOi8vd3d3LnczLm9yZy8yMDAxLzA0L3htbGRzaWctbW9yZSNobWFjLXNoYTI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiIwQzYzQjQ1OC0yNzAwLTRDRkItQUIyOC1CN0M2NkZENEUyQjgiLCJVc2VySWQiOiIwQzYzQjQ1OC0yNzAwLTRDRkItQUIyOC1CN0M2NkZENEUyQjgiLCJGdWxsTmFtZSI6IkFobWVkIiwiRW1haWwiOiJhaG1lZFFXRVJUUllZWUBnbWFpbC5jb20iLCJHb29nbGVJZCI6IjU2NDY1NCIsIk9mZmljZUlkIjoiNjg0Njg0NyIsIkdyYWRlTmFtZSI6Itin2YTYtdmBINin2YTYs9in2K_YsyDYp9mE2KfYqNiq2K_Yp9im2YkiLCJNb2JpbGVOdW1iZXIiOiIwMTExMDUxMTUyOSIsIlN0dWRpbmdZZWFyIjoiNiIsIlJvbGUiOiIzIiwiQ291bnRyeSI6IjAiLCJHb3Zlcm5vcmF0ZSI6IjAiLCJZT0IiOiIxIiwiR2VuZGVyIjoiMSIsIkVtYWlsQ29uZmlybWVkIjoiRmFsc2UiLCJTZW5kRW1haWwiOiJGYWxzZSIsIkF2YXRhcklkIjoiMiIsIkF2YXRhckltYWdlIjoiaHR0cDovL3d3dy5hbG1vYWxsZW0uY29tL21lZGlhL0xNU0FwcC9hdmF0YXIvU3R1ZGVudC8wMi5wbmciLCJNb2JpbGVOdW1iZXJDb25maXJtZWQiOiJUcnVlIiwiUHJvbW9Db2RlIjoiOTEwNCIsIlN1YnNjcmliZWQiOiJGYWxzZSIsImp0aSI6ImY1YTJlNjFjLTBjMzUtNGQ4OC05OTBjLTk1OWZlZjhhNGU4NSIsIm5iZiI6MTY0NjkwNjUyNiwiZXhwIjoxNjUyMDkwNTI2LCJpc3MiOiJTZWxhaGVsdGVsbWVlel9NaWRkbGV3YXJlX0lzc3VlciIsImF1ZCI6IlNlbGFoZWx0ZWxtZWV6X01pZGRsZXdhcmVfQXVkaWVuY2UifQ.9_c9iTkMrlHCgkdKCHeorABJf-5owooMIlse-AfGGFs";
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