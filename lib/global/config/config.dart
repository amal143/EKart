import 'package:ekart/main.dart';
import 'package:flutter/material.dart';
import '../constants/ui_constants.dart/ui.constants.dart';
import '../dependency_injection/get_it.dart';

class Config {
  //*--- Base url
  final String baseUrl = 'https://fakestoreapi.com/';

  //*--- Hive Database Name
  static const String dbName = 'eKart';
  static const String productDb = 'cartItems';
  String name = 'UserName';
}

//*---------- (Global Context)
BuildContext globalContext = navigationKey.currentState!.context;

//*---------- (Media_Query)
Size size = MediaQuery.sizeOf(globalContext);
//*---------- (UI constant object)
UiConstants uiCon = getIt<UiConstants>();
