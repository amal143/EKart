import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class KDimensions {
//!
//!<<<<< Height >>>>>//
  SizedBox sHeight({required double ht}) {
    return SizedBox(height: ht);
  }

//!<<<<< Width >>>>>//
  SizedBox sWidth({required double wd}) {
    return SizedBox(width: wd);
  }

//!<<<<< Border_Radius >>>>>//
  BorderRadius sRadius({required double br}) {
    return BorderRadius.circular(br);
  }
}

//!<<<<< Height >>>>>//
Widget kHeight05 = SizedBox(height: 5.h);
Widget kHeight10 = SizedBox(height: 10.h);
Widget kHeight15 = SizedBox(height: 15.h);
Widget kHeight20 = SizedBox(height: 20.h);
Widget kHeight25 = SizedBox(height: 25.h);
Widget kHeight30 = SizedBox(height: 30.h);
Widget kHeight35 = SizedBox(height: 35.h);
Widget kHeight40 = SizedBox(height: 40.h);
Widget kHeight45 = SizedBox(height: 45.h);
Widget kHeight50 = SizedBox(height: 50.h);
Widget kHeight75 = SizedBox(height: 75.h);
Widget kHeight100 = SizedBox(height: 100.h);
Widget kHeight150 = SizedBox(height: 150.h);

//!<<<<< Width >>>>>//
Widget kWidth05 = SizedBox(width: 5.w);
Widget kWidth10 = SizedBox(width: 10.w);
Widget kWidth15 = SizedBox(width: 15.w);
Widget kWidth20 = SizedBox(width: 20.w);
Widget kWidth25 = SizedBox(width: 25.w);
Widget kWidth30 = SizedBox(width: 30.w);
Widget kWidth35 = SizedBox(width: 35.w);
Widget kWidth40 = SizedBox(width: 40.w);

//!<<<<< Border_Radius >>>>>//
BorderRadius kRadius00 = BorderRadius.circular(0.r);
BorderRadius kRadius01 = BorderRadius.circular(1.r);
BorderRadius kRadius05 = BorderRadius.circular(5.r);
BorderRadius kRadius10 = BorderRadius.circular(10.r);
BorderRadius kRadius15 = BorderRadius.circular(15.r);
BorderRadius kRadius20 = BorderRadius.circular(20.r);
BorderRadius kRadius25 = BorderRadius.circular(25.r);
BorderRadius kRadius30 = BorderRadius.circular(30.r);
BorderRadius kRadius35 = BorderRadius.circular(35.r);
BorderRadius kRadius40 = BorderRadius.circular(40.r);
BorderRadius kRadius50 = BorderRadius.circular(50.r);
