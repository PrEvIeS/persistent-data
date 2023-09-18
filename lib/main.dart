

import 'config/app_config.dart';

Future<void> main() async {
  await bootstrap(
    firebaseInitialization: () async {},
    flavorConfiguration: () async {
      AppConfig.configDev();
    },
  );
}