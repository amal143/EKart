import 'package:ekart/module/cart/controller/cart.controller.dart';
import 'package:ekart/module/product/controller/product.controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../config/config.dart';
import '../constants/assets/asset.constants.dart';
import '../dimensions/dimensions.dart';
import '../styles/colors.dart';

class CommonCounterWidget extends StatelessWidget {
  const CommonCounterWidget({
    super.key,
    this.isBordered = false,
    this.bgColor,
    required this.price,
    required this.index,
  });
  final bool? isBordered;
  final Color? bgColor;
  final double price;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Consumer2<CartController, ProductController>(
      builder: (context, cartCtrl, productCtrl, _) {
        return Container(
          height: 45.h,
          decoration: BoxDecoration(
              borderRadius: kRadius50,
              color: isBordered == true
                  ? (bgColor ?? kWhite)
                  : const Color(0XFFCCD7CB),
              border: Border.all(
                  color: isBordered == true ? kBlack : kDividerGrey)),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              //!---Minus
              uiCon.transparentButton(
                onPressed: () {
                  cartCtrl.onMinus(context, price, index);
                },
                style: SvgPicture.asset(minus),
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                minimumSize: MaterialStatePropertyAll(Size(50.h, 38.h)),
                padding: const MaterialStatePropertyAll(EdgeInsets.zero),
              ),

              //!---Text
              Text(
                productCtrl.productList[index]['cartCount'].toString(),
                style: GoogleFonts.urbanist(
                    fontSize: 18, fontWeight: FontWeight.w600, color: kPrimary),
              ),

              //!---Plus
              uiCon.transparentButton(
                onPressed: () {
                  cartCtrl.onPlus(context, price, index);
                },
                style: SvgPicture.asset(plus),
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                minimumSize: MaterialStatePropertyAll(Size(50.h, 38.h)),
                padding: const MaterialStatePropertyAll(EdgeInsets.zero),
              ),
            ],
          ),
        );
      },
    );
  }
}
