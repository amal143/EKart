import 'package:get_it/get_it.dart';
import '../constants/ui_constants.dart/ui.constants.dart';

GetIt getIt = GetIt.instance;

setupGetIt() {
  getIt.registerLazySingleton<UiConstants>(() {
    return UiConstants();
  });
}
