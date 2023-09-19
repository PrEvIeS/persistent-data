import 'package:flutter_template/bootstrap.dart';
import 'package:flutter_template/config/dev_config.dart';

Future<void> main() async {
  await bootstrap(
    config: DevConfig(),
  );
}
