import 'package:get_it/get_it.dart';
import 'package:lean_provider/core/services/analyze_service.dart';
import 'package:lean_provider/core/services/api_service.dart';
import 'package:lean_provider/core/services/connectivity_service.dart';
import 'package:lean_provider/core/services/http_service.dart';
import 'package:lean_provider/core/services/local_storage_service.dart';
import 'package:lean_provider/core/services/navigation_service.dart';
import 'package:lean_provider/core/ui_models/entry_tile_model.dart';
import 'package:lean_provider/core/ui_models/tab_model.dart';
import 'package:lean_provider/core/ui_models/views/enter_form/enter_form_model.dart';
import 'package:lean_provider/core/ui_models/views/entry_detail/entry_detail_model.dart';
import 'package:lean_provider/core/ui_models/views/entry_list/entry_list_model.dart';
import 'package:lean_provider/core/ui_models/views/home/home_model.dart';
import 'package:lean_provider/core/ui_models/views/settings/settings_model.dart';
import 'package:lean_provider/core/ui_models/views/splash_screen/splash_screen_model.dart';

GetIt locator = GetIt.instance;

Future<void> setupLocator() async {
  //splash models
  locator.registerFactory(() => SplashScreenModel());

  //View Models
  locator.registerFactory(() => HomeModel());
  locator.registerFactory(() => SettingsModel());
  locator.registerFactory(() => TabModel());
  locator.registerFactory(() => EnterFormModel());
  locator.registerFactory(() => EntryTileModel());
  locator.registerFactory(() => EntryListModel());
  locator.registerFactory(() => EntryDetailModel());

  // Services
  locator.registerLazySingleton(() => NavigationService());
  locator.registerLazySingleton(() => ConnectivityService());
  locator.registerLazySingleton(() => LocalStorageService());
  locator.registerLazySingleton(() => ApiService());
  locator.registerLazySingleton(() => HttpService());
  locator.registerLazySingleton(() => AnalyzeService());

  await initializeServices();
}

Future<void> initializeServices() async {
  await locator<ConnectivityService>().init();
  locator<LocalStorageService>().init();
  locator<HttpService>().init();
}
