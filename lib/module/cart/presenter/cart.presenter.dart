import 'dart:developer';
import 'package:ekart/global/constants/inerceptor/interceptor.dart';
import 'package:ekart/module/product/presenter/product.presenter.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartPresenter extends ChangeNotifier {
  int counter = 1;
  int currentIndex = -1;
  onMinus(context, price, index) {
    if (counter >= 1) {
      final productCtrl = Provider.of<ProductPresenter>(context, listen: false);
      productCtrl.netAmount = productCtrl.netAmount -
          (price / productCtrl.cartItemlist[index]['cartCount']);
      price = price - price / productCtrl.cartItemlist[index]['cartCount'];
      userInfo.put('netAmount', productCtrl.netAmount.toString());
      productCtrl.cartItemlist[index]['cartCount']--;
      updateCartItemList(
          index, price, productCtrl.cartItemlist[index]['cartCount'], context);
    } else {}
    notifyListeners();
  }

  onPlus(context, price, index) {
    log(index.toString());
    final productCtrl = Provider.of<ProductPresenter>(context, listen: false);
    productCtrl.netAmount = productCtrl.netAmount +
        (price / productCtrl.cartItemlist[index]['cartCount']);
    price = price + price / productCtrl.cartItemlist[index]['cartCount'];
    userInfo.put('netAmount', productCtrl.netAmount.toString());
    productCtrl.cartItemlist[index]['cartCount']++;
    updateCartItemList(
        index, price, productCtrl.cartItemlist[index]['cartCount'], context);
    notifyListeners();
  }

  setIndex(int index) {
    currentIndex = index;
    notifyListeners();
  }

  updateCartItemList(int index, price, count, context) {
    final productCtrl = Provider.of<ProductPresenter>(context, listen: false);

    productCtrl.cartItemlist[index] = {
      "productImage": productCtrl.cartItemlist[index]['productImage'],
      "productName": productCtrl.cartItemlist[index]['productName'],
      "price": price,
      "cartCount": count
    };
    productInfo.put('productList', productCtrl.cartItemlist);
    notifyListeners();
  }
}
