import 'package:e_commerce_app/core/constant/app_colors.dart';
import 'package:e_commerce_app/core/widgets/main_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SingleCategory extends StatelessWidget {
  const SingleCategory({super.key, required this.image, required this.text});
  final String image;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 56 / 2.w,
          backgroundColor: AppColors.greyColor,
          child: Image.asset(image),
        ),
        MainTextWidget(text: text),
      ],
    );
  }
}
