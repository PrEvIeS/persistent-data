import 'package:flutter_template/config/config.dart';
import 'package:logger/logger.dart';

class DevConfig implements BaseConfig {
  @override
  String get baseUrl => '';

  @override
  Level get logLevel => Level.trace;
}
