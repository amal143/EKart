import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class CounterButtonWiget extends StatelessWidget {
  const CounterButtonWiget(
      {super.key, required this.onPressed, required this.icon});
  final Function() onPressed;
  final String icon;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      child: SizedBox(
        width: 15,
        height: 15,
        child: SvgPicture.asset(icon),
      ),
    );
  }
}
