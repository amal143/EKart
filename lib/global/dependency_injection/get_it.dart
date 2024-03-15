import 'package:get_it/get_it.dart';
import '../constants/ui_constants.dart/ui.constants.dart';
import '../functions/validation.functions.dart';

GetIt getIt = GetIt.instance;

setupGetIt() {
  getIt.registerLazySingleton<UiConstants>(() {
    return UiConstants();
  });

  getIt.registerSingleton<TextFieldValidation>(TextFieldValidation());
}
