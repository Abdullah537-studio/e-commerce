import 'package:e_commerce_app/core/widgets/main_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SectionHeader extends StatelessWidget {
  const SectionHeader({super.key, required this.title, required this.ontap});
  final String title;
  final Function()? ontap;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 16.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          MainTextWidget(text: title, styleType: TextStyleType.bodyLarge),
          GestureDetector(
            onTap: ontap,
            child: MainTextWidget(text: "See All"),
          ),
        ],
      ),
    );
  }
}
