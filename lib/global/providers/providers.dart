import 'package:ekart/module/auth/controller/auth.controller.dart';
import 'package:ekart/module/cart/controller/cart.controller.dart';
import 'package:ekart/module/home/controller/home.controller.dart';
import 'package:ekart/module/product/controller/product.controller.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import '../controllers/global.controller.dart';

List<SingleChildWidget> providers = [
  ChangeNotifierProvider(create: (context) => GlobalController()),
  ChangeNotifierProvider(create: (context) => AuthController()),
  ChangeNotifierProvider(create: (context) => ProductController()),
  ChangeNotifierProvider(create: (context) => HomeController()),
  ChangeNotifierProvider(create: (context) => CartController()),
];
