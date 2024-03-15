import 'package:ekart/module/product/controller/product.controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartController extends ChangeNotifier {
  int counter = 1;
  int currentIndex = -1;
  onMinus(context, price, index) {
    if (counter >= 1) {
      final productCtrl =
          Provider.of<ProductController>(context, listen: false);

      productCtrl.productList[index]['cartCount']--;
      productCtrl.netAmount = productCtrl.netAmount - price;
    } else {}

    notifyListeners();
  }

  onPlus(context, price, index) {
    final productCtrl = Provider.of<ProductController>(context, listen: false);
    productCtrl.productList[index]['cartCount']++;
    productCtrl.netAmount = productCtrl.netAmount + price;

    notifyListeners();
  }

  setIndex(int index) {
    currentIndex = index;
    notifyListeners();
  }
}
