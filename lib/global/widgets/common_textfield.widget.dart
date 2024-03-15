import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../config/config.dart';
import '../dimensions/dimensions.dart';
import '../styles/colors.dart';

class CommonTextFieldWidget extends StatelessWidget {
  const CommonTextFieldWidget({
    super.key,
    this.onTap,
    this.maxLines,
    this.maxLength,
    this.focusNode,
    this.suffixIcon,
    this.prefixIcon,
    this.hintText = '',
    required this.label,
    required this.validator,
    required this.controller,
    this.keyboardType = TextInputType.name,
    this.textCapitalization = TextCapitalization.none,
    this.onChanged,
    this.fillColor,
    this.filled,
    this.prefix,
    this.obscureText,
  });
  final String label;
  final int? maxLines;
  final int? maxLength;
  final String? hintText;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final Widget? prefix;
  final FocusNode? focusNode;
  final void Function()? onTap;
  final TextInputType? keyboardType;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final TextCapitalization textCapitalization;
  final Function(String)? onChanged;
  final Color? fillColor;
  final bool? filled;
  final bool? obscureText;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        //!---Label Text
        Text(
          label,
          style: GoogleFonts.urbanist(
              color: kBlack, fontSize: 14, fontWeight: FontWeight.w400),
        ),
        KDimensions().sHeight(ht: size.height * 0.004),

        //!---Text form field
        TextFormField(
          onChanged: onChanged,
          onTap: onTap,
          maxLines: maxLines,
          cursorColor: kBlack,
          focusNode: focusNode,
          maxLength: maxLength,
          validator: validator,
          controller: controller,
          keyboardType: keyboardType,
          textCapitalization: textCapitalization,
          obscureText: obscureText ?? false,
          style: GoogleFonts.urbanist(
            color: kBlack,
            fontSize: 18.sp,
            fontWeight: FontWeight.w500,
          ),
          decoration: InputDecoration(
            filled: true,
            counterText: '',
            fillColor: fillColor ?? kWhite,
            hintText: hintText,
            suffixIcon: suffixIcon,
            prefixIcon: prefixIcon,
            prefix: prefix,
            contentPadding: EdgeInsets.all(15.h),
            enabledBorder: OutlineInputBorder(
              borderRadius: kRadius15,
              borderSide: BorderSide(
                width: 0.8.h,
                color: const Color(0XFFABABAB),
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: kRadius15,
              borderSide: BorderSide(
                width: 0.8.h,
                color: const Color(0XFFABABAB),
              ),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: kRadius15,
              borderSide: BorderSide(
                width: 0.8.h,
                color: kDividerGrey,
              ),
            ),
            hintStyle: GoogleFonts.urbanist(
              fontSize: 16.sp,
              fontWeight: FontWeight.w500,
              color: kBlack,
            ),
          ),
        ),
      ],
    );
  }
}
