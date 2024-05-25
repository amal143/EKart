import 'package:ekart/global/config/config.dart';
import 'package:ekart/global/dimensions/dimensions.dart';
import 'package:ekart/global/styles/colors.dart';
import 'package:ekart/module/cart/view/cart.screen.dart';
import 'package:ekart/module/home/presenter/home.presenter.dart';
import 'package:ekart/module/product/view/product.screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:provider/provider.dart';

import '../../../global/widgets/cart_icon.widget.dart';
import '../widget/item_card.widget.dart';

class HomeScreen extends StatefulWidget {
  static const route = '/home';
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final homeCtrl = Provider.of<HomePresenter>(context, listen: false);
      homeCtrl.callGetProductsApiService();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<HomePresenter>(builder: (context, homeCtrl, _) {
      return Scaffold(
        backgroundColor: kWhite,
        body: SafeArea(
            child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 15.h),
          child: homeCtrl.apiLoader
              ? Center(
                  child: LoadingAnimationWidget.fourRotatingDots(
                      color: kPrimary, size: 50),
                )
              : Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                            width: size.width * 0.75,
                            height: 45,
                            child: SearchBar(
                              controller: homeCtrl.searchCtrl,
                              backgroundColor:
                                  const MaterialStatePropertyAll(kDividerGrey),
                              elevation: const MaterialStatePropertyAll(0),
                              side: const MaterialStatePropertyAll(
                                  BorderSide(color: kDividerGrey)),
                              leading: const Icon(
                                Icons.search,
                                color: Colors.grey,
                              ),
                            )),

                        //*-- Cart Icon Widget
                        GestureDetector(
                            onTap: () {
                              Navigator.of(context).pushNamedAndRemoveUntil(
                                  CartScreen.route, (route) => true);
                            },
                            child: const CartIcon()),
                      ],
                    ),
                    KDimensions().sHeight(ht: 20.h),
                    Expanded(
                      child: GridView.builder(
                          physics: const BouncingScrollPhysics(),
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  childAspectRatio: 4 / 5.4,
                                  crossAxisSpacing: 20.h,
                                  mainAxisSpacing: 20.h),
                          itemCount:
                              homeCtrl.products.length, // total number of items
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                homeCtrl.getRating(
                                    homeCtrl.products[index].rating?.rate);
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => ProductScreen(
                                          index: index,
                                        )));
                              },
                              child: ItemCard(
                                index: index,
                              ),
                            );
                          }),
                    )
                  ],
                ),
        )),
      );
    });
  }
}
