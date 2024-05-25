import 'package:ekart/module/cart/presenter/cart.presenter.dart';
import 'package:ekart/module/home/presenter/home.presenter.dart';
import 'package:ekart/module/product/presenter/product.presenter.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import '../presenter/global.controller.dart';

List<SingleChildWidget> providers = [
  ChangeNotifierProvider(create: (context) => GlobalPresenter()),
  ChangeNotifierProvider(create: (context) => ProductPresenter()),
  ChangeNotifierProvider(create: (context) => HomePresenter()),
  ChangeNotifierProvider(create: (context) => CartPresenter()),
];
