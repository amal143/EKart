import 'dart:async';
import 'package:ekart/global/dimensions/dimensions.dart';
import 'package:ekart/module/home/view/home.screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../../global/styles/colors.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 2), () async {
      Navigator.of(context)
          .pushNamedAndRemoveUntil(HomeScreen.route, (route) => true);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text(
              'E-Kart',
              style: GoogleFonts.urbanist(
                  color: kPrimary, fontSize: 35, fontWeight: FontWeight.bold),
            ),
          ),
          KDimensions().sHeight(ht: 20.h),
          Center(
              child: LoadingAnimationWidget.fourRotatingDots(
                  color: kPrimary, size: 50))
        ],
      ),
    );
  }
}
