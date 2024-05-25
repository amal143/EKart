import 'package:ekart/main.dart';
import 'package:flutter/material.dart';

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
