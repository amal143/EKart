import 'package:ekart/global/config/config.dart';
import 'package:ekart/global/constants/assets/asset.constants.dart';
import 'package:ekart/global/constants/inerceptor/interceptor.dart';
import 'package:ekart/global/dimensions/dimensions.dart';
import 'package:ekart/global/styles/colors.dart';
import 'package:ekart/global/widgets/common_btton.widget.dart';
import 'package:ekart/global/widgets/common_counter.widget.dart';
import 'package:ekart/module/cart/controller/cart.controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:provider/provider.dart';

import '../../product/controller/product.controller.dart';

class CartScreen extends StatefulWidget {
  static const route = '/cart';
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final productCtrl =
          Provider.of<ProductController>(context, listen: false);
      productCtrl.onInIt();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer2<CartController, ProductController>(
        builder: (context, cartCtrl, productCtrl, _) {
      return Scaffold(
        body: SafeArea(
            child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
          child: Column(
            children: [
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: const Icon(
                      Icons.arrow_back_ios,
                      color: kPrimary,
                      size: 25,
                    ),
                  ),
                  KDimensions().sWidth(wd: 25.h),
                  Text(
                    "My Cart",
                    style: GoogleFonts.urbanist(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: kPrimary),
                  ),
                ],
              ),
              KDimensions().sHeight(ht: 20.h),
              Expanded(
                child: productCtrl.cartItemlist.isEmpty
                    ? Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: size.height * 0.3,
                            width: size.width * 0.6,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(emptyList))),
                          ),
                          Text(
                            "Your cart is empty",
                            style: GoogleFonts.urbanist(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                color: kBlack),
                          ),
                        ],
                      )
                    : ListView.builder(
                        itemCount: productCtrl.cartItemlist.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 05),
                            child: Container(
                              padding: EdgeInsets.all(10.w),
                              decoration: BoxDecoration(
                                  color: kBgColor,
                                  borderRadius: BorderRadius.circular(10.r)),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          if (productCtrl.deleteLoader ==
                                              false) {
                                            productCtrl.deleteItem(index);
                                          }
                                        },
                                        child: productCtrl.deleteLoader &&
                                                productCtrl.currentIndex ==
                                                    index
                                            ? LoadingAnimationWidget
                                                .fourRotatingDots(
                                                    color: kPrimary, size: 20)
                                            : const Icon(
                                                Icons.delete,
                                                color: kPrimary,
                                                size: 20,
                                              ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Container(
                                        height: 100,
                                        width: 100,
                                        decoration: BoxDecoration(
                                            image: DecorationImage(
                                                image: NetworkImage(productCtrl
                                                        .cartItemlist[index]
                                                    ["productImage"]))),
                                      ),
                                      KDimensions().sWidth(wd: 05.w),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(
                                            width: size.width * 0.5,
                                            child: Text(
                                              productCtrl.cartItemlist[index]
                                                  ["productName"],
                                              style: GoogleFonts.urbanist(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w500,
                                                  color: kPrimary),
                                              overflow: TextOverflow.ellipsis,
                                              textAlign: TextAlign.justify,
                                            ),
                                          ),
                                          Text(
                                            "Price: ${productCtrl.cartItemlist[index]["price"].toStringAsFixed(3)}",
                                            style: GoogleFonts.urbanist(
                                                fontSize: 17,
                                                fontWeight: FontWeight.w500,
                                                color: kPrimary),
                                            overflow: TextOverflow.ellipsis,
                                            textAlign: TextAlign.justify,
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Delivery by march 20",
                                        style: GoogleFonts.urbanist(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500,
                                            color: kPrimary),
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.justify,
                                      ),
                                      CommonCounterWidget(
                                        price: productCtrl.cartItemlist[index]
                                            ["price"],
                                        index: index,
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          );
                        }),
              )
            ],
          ),
        )),
        persistentFooterButtons: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: size.width * 0.4,
                child: Text(
                  '₹ ${double.parse(userInfo.get('netAmount') ?? "0").toStringAsFixed(3)}',
                  style: GoogleFonts.urbanist(
                      fontSize: 16, fontWeight: FontWeight.bold, color: kBlack),
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.justify,
                ),
              ),
              CommonButtonWidget(
                  onTap: () {},
                  bgColor: kPrimary,
                  txtColor: kWhite,
                  title: "Place Order",
                  height: 45,
                  width: size.width * 0.5,
                  isLoading: false),
            ],
          )
        ],
      );
    });
  }
}
