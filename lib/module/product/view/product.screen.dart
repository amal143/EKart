import 'package:ekart/global/dimensions/dimensions.dart';
import 'package:ekart/global/styles/colors.dart';
import 'package:ekart/global/widgets/common_btton.widget.dart';
import 'package:ekart/module/product/presenter/product.presenter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../../global/config/config.dart';
import '../../../global/widgets/cart_icon.widget.dart';
import '../../home/presenter/home.presenter.dart';

class ProductScreen extends StatelessWidget {
  static const route = '/product';
  const ProductScreen({super.key, required this.index});
  final int index;
  @override
  Widget build(BuildContext context) {
    return Consumer2<HomePresenter, ProductPresenter>(
        builder: (context, homeCtrl, productCtrl, _) {
      return Scaffold(
        backgroundColor: kWhite,
        body: SafeArea(
            child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
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
                  Center(
                    child: Container(
                      height: size.height * 0.3,
                      width: size.width * 0.5,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.r),
                          image: DecorationImage(
                              image: NetworkImage(
                                  homeCtrl.products[index].image ?? ""))),
                    ),
                  ),
                  KDimensions().sHeight(ht: 20.h),
                  SizedBox(
                    width: size.width,
                    child: Text(
                      homeCtrl.products[index].title ?? "",
                      style: GoogleFonts.urbanist(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: kPrimary),
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.justify,
                    ),
                  ),
                  KDimensions().sHeight(ht: 30.h),
                  Text(
                    homeCtrl.products[index].description ?? "",
                    style: GoogleFonts.urbanist(
                        fontSize: 17,
                        fontWeight: FontWeight.w500,
                        color: kBlack),
                    textAlign: TextAlign.justify,
                  ),
                  KDimensions().sHeight(ht: 30.h),
                  Text(
                    'Price: ₹ ${homeCtrl.products[index].price ?? 0.0}',
                    style: GoogleFonts.urbanist(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: kBlack),
                    textAlign: TextAlign.justify,
                  ),
                  KDimensions().sHeight(ht: 10.h),
                  Text(
                    'Rating:',
                    style: GoogleFonts.urbanist(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: kBlack),
                    textAlign: TextAlign.justify,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: size.width * 0.5,
                        child: LinearProgressIndicator(
                          value: homeCtrl.ratePercentage,
                          color: kPrimary,
                          borderRadius: BorderRadius.circular(15.r),
                        ),
                      ),
                      KDimensions().sWidth(wd: 15.h),
                      Text(
                        '${homeCtrl.products[index].rating?.rate ?? ""}',
                        style: GoogleFonts.urbanist(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: kBlack),
                        textAlign: TextAlign.justify,
                      ),
                    ],
                  ),
                ],
              ),
              Column(
                children: [
                  //*--- Counter widget
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CommonButtonWidget(
                          onTap: () {},
                          bgColor: kPrimary,
                          txtColor: kWhite,
                          title: 'Buy Now',
                          height: 45.h,
                          width: size.width * 0.75,
                          isLoading: false),
                      GestureDetector(
                          onTap: () {
                            productCtrl.addToCart(
                                context,
                                homeCtrl.products[index].image ?? "",
                                homeCtrl.products[index].title ?? "",
                                homeCtrl.products[index].price ?? 0.0,
                                1);
                          },
                          child: const CartIcon()),
                    ],
                  )
                ],
              )
            ],
          ),
        )),
      );
    });
  }
}
