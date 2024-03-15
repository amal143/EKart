import 'package:ekart/global/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../constants/assets/asset.constants.dart';

class CartIcon extends StatelessWidget {
  const CartIcon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.w),
      decoration: BoxDecoration(
        border: Border.all(color: kPrimary),
        shape: BoxShape.circle,
      ),
      child: SvgPicture.asset(
        //icon,
        cartIcon,
        height: 20.sp,
        width: 20.sp,
      ),
    );
  }
}
