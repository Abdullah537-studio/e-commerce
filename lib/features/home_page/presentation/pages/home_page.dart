import 'package:e_commerce_app/core/constant/app_colors.dart';
import 'package:e_commerce_app/core/strings/images_strings.dart';
import 'package:e_commerce_app/core/widgets/main_scaffold.dart';
import 'package:e_commerce_app/core/widgets/main_text_widget.dart';
import 'package:e_commerce_app/features/home_page/presentation/widgets/single_category.dart';
import 'package:e_commerce_app/features/home_page/presentation/widgets/single_top_selling_product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MainScaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CircleAvatar(radius: 20.w),
                  Container(
                    width: 74.w,
                    height: 4.h,

                    decoration: BoxDecoration(
                      color: AppColors.greyColor,
                      border: Border.all(),
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        MainTextWidget(text: "Men"),
                        SvgPicture.asset(ImagesStrings.arrowDownSvg),
                      ],
                    ),
                  ),

                  CircleAvatar(
                    radius: 20.w,
                    backgroundColor: AppColors.primaryColor,
                    child: SvgPicture.asset(ImagesStrings.cartSvg),
                  ),
                ],
              ),
              Container(
                width: double.infinity,
                margin: EdgeInsets.symmetric(vertical: 24.h),
                padding: EdgeInsets.symmetric(horizontal: 19.w),
                decoration: BoxDecoration(
                  color: AppColors.greyColor,
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(24.r),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SvgPicture.asset(ImagesStrings.searchSvg),
                    SizedBox(width: 12.w),
                    MainTextWidget(text: "Search"),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  MainTextWidget(
                    text: "Category",
                    styleType: TextStyleType.bodyLarge,
                  ),
                  MainTextWidget(text: "See All"),
                ],
              ),
              SingleCategory(
                image: ImagesStrings.imageCategory,
                text: "Hoodies",
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  MainTextWidget(
                    text: "Top Selling",
                    styleType: TextStyleType.bodyLarge,
                  ),
                  MainTextWidget(text: "See All"),
                ],
              ),
              SingleTopSellingProduct(
                image: ImagesStrings.imageProduct,
                text: "Men's Harrington Jacket",
                price: 148.00,
                onTapFavorite: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
