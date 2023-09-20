import 'package:logger/logger.dart';

abstract class BaseConfig {
  String get baseUrl;

  Level get logLevel;
}
