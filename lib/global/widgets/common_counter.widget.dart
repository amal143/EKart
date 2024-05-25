import 'package:ekart/global/widgets/counter.button.dart';
import 'package:ekart/module/cart/presenter/cart.presenter.dart';
import 'package:ekart/module/product/presenter/product.presenter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
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
    return Consumer2<CartPresenter, ProductPresenter>(
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
              CounterButtonWiget(
                onPressed: () {
                  cartCtrl.onMinus(context, price, index);
                },
                icon: minus,
              ),

              //!---Text
              Text(
                productCtrl.cartItemlist[index]['cartCount'].toString(),
                style: GoogleFonts.urbanist(
                    fontSize: 18, fontWeight: FontWeight.w600, color: kPrimary),
              ),

              //!---Plus
              CounterButtonWiget(
                onPressed: () {
                  cartCtrl.onPlus(context, price, index);
                },
                icon: plus,
              ),
            ],
          ),
        );
      },
    );
  }
}
