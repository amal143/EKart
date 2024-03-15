import 'dart:convert';
import 'dart:developer';
import 'package:ekart/module/home/model/product.model.dart';
import 'package:ekart/module/home/service/get_product_service.dart';
import 'package:flutter/cupertino.dart';

class HomeController extends ChangeNotifier {
  bool apiLoader = false;
  TextEditingController searchCtrl = TextEditingController();
  List<ProductModel> products = [];
//*-- Get products list service
  Future<bool> callGetProductsApiService() async {
    apiLoader = true;
    notifyListeners();
    final response = await GetPoductService().getProducts();
    apiLoader = false;
    notifyListeners();
    if (response.statusCode == 200) {
      products = (jsonDecode(response.body) as List)
          .map((item) => ProductModel.fromJson(item))
          .toList();
      notifyListeners();
      return true;
    } else {
      return false;
    }
  }

  double ratePercentage = 0.0;
  getRating(rate) {
    if (rate != null) {
      ratePercentage = (rate / 10) * 2;
      log(ratePercentage.toString());
      notifyListeners();
    }
  }
}
