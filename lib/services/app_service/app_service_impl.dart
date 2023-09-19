import 'package:flutter_template/constants/app_keys.dart';
import 'package:flutter_template/services/app_service/app_service.dart';
import 'package:hive_flutter/hive_flutter.dart';

class AppServiceImpl implements AppService {
  AppServiceImpl();

  final Box _localStorageService = Hive.box('settings');

  @override
  bool get isDarkMode => _localStorageService.get(AppKeys.darkModeKey) ?? false;

  @override
  bool get isFirstUse =>
      _localStorageService.get(AppKeys.isFirstUseKey) ?? true;

  @override
  String get locale =>
      _localStorageService.get(AppKeys.localeKey) ?? AppKeys.defaultLocale;

  @override
  Future<void> setIsDarkMode({required bool darkMode}) async {
    return _localStorageService.put(
      AppKeys.darkModeKey,
      darkMode,
    );
  }

  @override
  Future<void> setIsFirstUse({required bool isFirstUse}) async {
    return _localStorageService.put(
      AppKeys.isFirstUseKey,
      isFirstUse,
    );
  }

  @override
  Future<void> setLocale({required String locale}) async {
    return _localStorageService.put(
      AppKeys.localeKey,
      locale,
    );
  }
}
