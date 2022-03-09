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
    dio.options.headers["Authorization"] = "Bearer eyJhbGciOiJodHRwOi8vd3d3LnczLm9yZy8yMDAxLzA0L3htbGRzaWctbW9yZSNobWFjLXNoYTI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJERERBRjlFOC0yNTcwLTRGREItQjYyOS0xMzQwNjlFOTE1QTEiLCJVc2VySWQiOiJERERBRjlFOC0yNTcwLTRGREItQjYyOS0xMzQwNjlFOTE1QTEiLCJGdWxsTmFtZSI6IkFobWVkIEFidWVsbm91ciIsIkVtYWlsIjoiYWhtZWRhYnVlbG5vb3JAb3V0bG9vay5jb20iLCJHb29nbGVJZCI6IiIsIk9mZmljZUlkIjoiZGE0NGM2YWJlNTc5ZDNjMSIsIkdyYWRlTmFtZSI6Itin2YTYtdmBINin2YTYs9in2K_YsyDYp9mE2KfYqNiq2K_Yp9im2YkiLCJNb2JpbGVOdW1iZXIiOiIiLCJTdHVkaW5nWWVhciI6IjYiLCJSb2xlIjoiMSIsIkNvdW50cnkiOiIwIiwiR292ZXJub3JhdGUiOiIwIiwiWU9CIjoiMCIsIkdlbmRlciI6IjAiLCJFbWFpbENvbmZpcm1lZCI6IlRydWUiLCJTZW5kRW1haWwiOiJGYWxzZSIsIkF2YXRhcklkIjoiMCIsIkF2YXRhckltYWdlIjoiaHR0cDovL3d3dy5hbG1vYWxsZW0uY29tL21lZGlhL0xNU0FwcC9hdmF0YXIvZGVmYXVsdC9kZWZhdWx0LnBuZyIsIk1vYmlsZU51bWJlckNvbmZpcm1lZCI6IkZhbHNlIiwiUHJvbW9Db2RlIjoiOTA5NyIsIlN1YnNjcmliZWQiOiJGYWxzZSIsImp0aSI6ImY5ZDJmMzgzLTRhNGMtNGU5MC05ZTdlLTg2ZDY3NjM3ZGI5MSIsIm5iZiI6MTY0Njg0Mzc4MiwiZXhwIjoxNjUyMDI3NzgyLCJpc3MiOiJTZWxhaGVsdGVsbWVlel9NaWRkbGV3YXJlX0lzc3VlciIsImF1ZCI6IlNlbGFoZWx0ZWxtZWV6X01pZGRsZXdhcmVfQXVkaWVuY2UifQ.h09hMkEkbyD20M39TjFhc8w6tA4khE1eg9Agv7JoOYM";
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