import 'dart:async';
import 'dart:developer';

import 'package:ekart/global/constants/inerceptor/interceptor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../global/styles/colors.dart';

class ProductController extends ChangeNotifier {
  List productList = [];
  double netAmount = 0.0;
  void addToCart(context, String productImage, String productName, double price,
      int cartCount) {
    var existingItem = productList.where(
      (element) => element['productName'] == productName,
    );
    log(existingItem.toString());
    if (existingItem.isNotEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        backgroundColor: kBlack,
        showCloseIcon: true,
        closeIconColor: kWhite,
        behavior: SnackBarBehavior.floating,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.r)),
        content: const Text("Item Already exists in cart"),
      ));
    } else {
      productList.add({
        "productImage": productImage,
        "productName": productName,
        "price": price,
        "cartCount": cartCount
      });
      productInfo.put('productList', productList);
      netAmount = netAmount + price;
      userInfo.put('netAmount', netAmount.toString());
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        backgroundColor: kBlack,
        showCloseIcon: true,
        closeIconColor: kWhite,
        behavior: SnackBarBehavior.floating,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.r)),
        content: const Text("Item added to cart"),
      ));
    }
    notifyListeners();
  }

  List cartItemlist = [];
  onInIt() {
    cartItemlist = productInfo.get("productList") ?? [];
    notifyListeners();
  }

  bool deleteLoader = false;
  int currentIndex = -1;
  deleteItem(int index) {
    currentIndex = index;
    deleteLoader = true;
    notifyListeners();
    Timer(const Duration(seconds: 3), () async {
      await cartItemlist.removeAt(index);
      netAmount = netAmount - cartItemlist[index]['price'];
      userInfo.put('netAmount', netAmount.toString());
      deleteLoader = false;
      notifyListeners();
    });
  }
}
