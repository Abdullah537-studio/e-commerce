import 'package:e_commerce_app/core/constant/app_colors.dart';
import 'package:e_commerce_app/core/strings/images_strings.dart';
import 'package:e_commerce_app/core/widgets/main_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SingleTopSellingProduct extends StatelessWidget {
  const SingleTopSellingProduct({
    super.key,
    required this.image,
    required this.text,
    required this.price,
    required this.onTapFavorite,
  });
  final String image;
  final String text;
  final double price;
  final Function()? onTapFavorite;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 16.w),
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              color: AppColors.greyColor,

              border: Border.all(color: Colors.transparent),
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: Column(
              spacing: 8.h,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width: 159.w,
                  height: 281.h,
                  child: Image.asset(image),
                ),
                MainTextWidget(text: text),
                MainTextWidget(
                  textAlign: TextAlign.left,
                  text: "\$ $price",
                  styleType: TextStyleType.bodyLarge,
                ),
              ],
            ),
          ),
          Positioned(
            top: 10.h,
            right: 12.w,
            child: GestureDetector(
              onTap: onTapFavorite,
              child: SvgPicture.asset(ImagesStrings.favoriteSvg),
            ),
          ),
        ],
      ),
    );
  }
}
