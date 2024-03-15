import 'package:ekart/global/styles/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class CommonButtonWidget extends StatelessWidget {
  const CommonButtonWidget({
    super.key,
    required this.onTap,
    required this.bgColor,
    required this.txtColor,
    required this.title,
    required this.height,
    required this.width,
    required this.isLoading,
  });
  final Function() onTap;
  final Color bgColor;
  final Color txtColor;
  final String title;
  final double height;
  final double width;
  final bool isLoading;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25.r), color: bgColor),
        child: Center(
          child: isLoading
              ? LoadingAnimationWidget.fourRotatingDots(color: kWhite, size: 20)
              : Text(
                  title,
                  style: TextStyle(
                      color: txtColor,
                      fontSize: 14,
                      fontWeight: FontWeight.w500),
                ),
        ),
      ),
    );
  }
}
