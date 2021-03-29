import 'package:get_it/get_it.dart';
import 'package:flutter_application_1/services/navigation_service.dart';

///what the classes use to find the navigation service
///
///@author Bobby Newsome
GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => NavigationService());
}