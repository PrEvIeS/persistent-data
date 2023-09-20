import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_template/config/base_config.dart';
import 'package:get_it/get_it.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioClient {
  DioClient._();

  static const String dioInstanceName = 'dioInstance';
  static final GetIt _injector = GetIt.instance;

  static void setup(BaseConfig config) {
    _setupDio(config);
  }

  static void _setupDio(BaseConfig config) {
    /// Dio
    _injector.registerLazySingleton<Dio>(
      () {
        // TODO(boilerplate): custom DIO here
        final Dio dio = Dio(
          BaseOptions(
            baseUrl: config.baseUrl,
          ),
        );
        if (!kReleaseMode) {
          dio.interceptors.add(
            PrettyDioLogger(
              requestHeader: true,
              requestBody: true,
              responseHeader: true,
              request: false,
            ),
          );
        }
        return dio;
      },
      instanceName: dioInstanceName,
    );
  }
}
