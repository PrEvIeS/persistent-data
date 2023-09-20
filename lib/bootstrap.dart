import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_template/config/base_config.dart';
import 'package:flutter_template/core/bloc/bloc_observer.dart';
import 'package:flutter_template/services/app_service/app_service.dart';
import 'package:flutter_template/services/app_service/app_service_impl.dart';
import 'package:flutter_template/services/crashlytics_service/crashlytics_service.dart';
import 'package:flutter_template/services/crashlytics_service/firebase_crashlytics_service.dart';
import 'package:flutter_template/services/http_service/dio.dart';
import 'package:flutter_template/usecases/app/bloc/app_bloc.dart';
import 'package:flutter_template/usecases/app/view/app.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:logger/logger.dart';

Future<void> bootstrap({
  BaseConfig? config,
}) async {
  await runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Hive.initFlutter();
    await Hive.openBox('settings');

    Logger.level = config!.logLevel;

    DioClient.setup(config);

    GetIt.instance
      ..registerSingletonAsync<CrashlyticsService>(() async {
        return FirebaseCrashlyticsService();
      })
      ..registerSingleton<AppService>(
        AppServiceImpl(),
      )
      ..registerFactory(
        () => Logger(
          printer: PrefixPrinter(
            PrettyPrinter(
              methodCount: 0,
              errorMethodCount: 500,
              lineLength: 100,
            ),
          ),
        ),
      )
      ..registerLazySingleton<AppBloc>(
        () => AppBloc(
          appService: GetIt.instance(),
          logService: GetIt.instance(),
        ),
      );

    await GetIt.instance.allReady();

    Bloc.observer = AppBlocObserver();

    runApp(const App());
  }, (error, stack) {
    GetIt.instance<CrashlyticsService>().recordException(error, stack);
  });
}
