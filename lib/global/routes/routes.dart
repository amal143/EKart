import 'package:ekart/module/auth/view/sign_in.screen.dart';
import 'package:ekart/module/auth/view/sign_up.screen.dart';
import 'package:ekart/module/cart/view/cart.screen.dart';
import 'package:ekart/module/home/view/home.screen.dart';
import 'package:ekart/module/product/view/product.screen.dart';
import 'package:flutter/material.dart';

Map<String, Widget Function(BuildContext)> routes = {
  '/': (BuildContext context) => const HomeScreen(),
  '/signIn': (BuildContext context) => const SignInScreen(),
  '/signUp': (BuildContext context) => const SignUpScreen(),
  '/home': (BuildContext context) => const HomeScreen(),
  '/product': (BuildContext context) => const ProductScreen(
        index: 0,
      ),
  '/cart': (BuildContext context) => const CartScreen(),
};
