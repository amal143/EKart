import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../../global/config/config.dart';
import '../../../global/styles/colors.dart';
import '../controller/home.controller.dart';

class ItemCard extends StatelessWidget {
  const ItemCard({super.key, required this.index});
  final int index;
  @override
  Widget build(BuildContext context) {
    return Consumer<HomeController>(builder: (context, homeCtrl, _) {
      return Container(
        padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.h),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.r),
            border: Border.all(color: kDividerGrey)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              height: 140,
              width: size.width * 0.4,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.r),
                  image: DecorationImage(
                      image:
                          NetworkImage(homeCtrl.products[index].image ?? ""))),
            ),
            SizedBox(
              width: size.width * 0.4,
              child: Center(
                child: Text(
                  '${homeCtrl.products[index].title}',
                  style: GoogleFonts.urbanist(
                      fontSize: 16, fontWeight: FontWeight.w600),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            )
          ],
        ),
      );
    });
  }
}
