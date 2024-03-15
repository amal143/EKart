import 'package:flutter/material.dart';
import '../../styles/colors.dart';

class UiConstants {
//*---------------------------------------------------------------- (Transparent_Button)
  TextButton transparentButton(
      {required Widget style,
      bool apiCalling = false,
      required void Function()? onPressed,
      MaterialTapTargetSize? tapTargetSize,
      MaterialStateProperty<Size?>? minimumSize,
      MaterialStateProperty<EdgeInsetsGeometry?>? padding,
      MaterialStateProperty<Color?> overlayColor =
          const MaterialStatePropertyAll(kWhite)}) {
    return TextButton(
        style: ButtonStyle(
            padding: padding,
            minimumSize: minimumSize,
            overlayColor: overlayColor,
            tapTargetSize: MaterialTapTargetSize.shrinkWrap),
        onPressed: onPressed,
        child: style);
  }
//*---------------------------------------------------------------- (Transparent_Button)
}
