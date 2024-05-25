import 'package:ekart/module/cart/view/cart.screen.dart';
import 'package:ekart/module/home/view/home.screen.dart';
import 'package:ekart/module/product/view/product.screen.dart';
import 'package:ekart/module/splash/view/splash.screen.dart';
import 'package:flutter/material.dart';

Map<String, Widget Function(BuildContext)> routes = {
  '/': (BuildContext context) => const SplashScreen(),
  '/home': (BuildContext context) => const HomeScreen(),
  '/product': (BuildContext context) => const ProductScreen(
        index: 0,
      ),
  '/cart': (BuildContext context) => const CartScreen(),
};
