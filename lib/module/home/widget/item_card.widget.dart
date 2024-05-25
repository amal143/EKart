import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../../global/config/config.dart';
import '../../../global/styles/colors.dart';
import '../presenter/home.presenter.dart';

class ItemCard extends StatelessWidget {
  const ItemCard({super.key, required this.index});
  final int index;
  @override
  Widget build(BuildContext context) {
    return Consumer<HomePresenter>(builder: (context, homeCtrl, _) {
      return Container(
        padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.h),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.r),
            border: Border.all(color: kDividerGrey)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CachedNetworkImage(
              imageUrl: homeCtrl.products[index].image ?? "",
              imageBuilder: (context, imageProvider) => Container(
                height: 140,
                width: size.width * 0.4,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.r),
                    image: DecorationImage(
                        image: NetworkImage(
                            homeCtrl.products[index].image ?? ""))),
              ),
              placeholder: (context, url) => const CircularProgressIndicator(
                color: kPrimary,
              ),
              errorWidget: (context, url, error) => const Icon(Icons.error),
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
