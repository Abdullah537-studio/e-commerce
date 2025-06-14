import 'package:e_commerce_app/core/constant/app_colors.dart';
import 'package:e_commerce_app/core/enum/bottom_nav_item.dart';
import 'package:e_commerce_app/core/general_cubit/cubits/bottom_nav/bottom_nav_cubit.dart';
import 'package:e_commerce_app/core/strings/images_strings.dart';
import 'package:e_commerce_app/core/widgets/main_scaffold.dart';
import 'package:e_commerce_app/features/home_page/presentation/pages/home_page.dart';
import 'package:e_commerce_app/features/home_page/presentation/pages/notification_page.dart';
import 'package:e_commerce_app/features/home_page/presentation/pages/order_page.dart';
import 'package:e_commerce_app/features/home_page/presentation/pages/setting_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class MainPages extends StatelessWidget {
  const MainPages({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BottomNavCubit(),
      child: BlocBuilder<BottomNavCubit, BottomNavItem>(
        builder: (context, selectedTab) {
          return MainScaffold(
            body: bodyFor(selectedTab),

            bottomNavigationBar: SizedBox(
              width: double.infinity,
              height: 80.h,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: BottomNavItem.values.map((item) {
                  final asset = _assetFor(item);
                  final isSelected = item == selectedTab;
                  final color = isSelected
                      ? AppColors.primaryColor
                      : Colors.black;
                  return GestureDetector(
                    onTap: () => context.read<BottomNavCubit>().selectTab(item),
                    child: SvgPicture.asset(
                      asset,
                      colorFilter: ColorFilter.mode(color, BlendMode.srcIn),
                    ),
                  );
                }).toList(),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget bodyFor(BottomNavItem item) {
    switch (item) {
      case BottomNavItem.homePage:
        return HomePage();

      case BottomNavItem.notification:
        return NotificationPage();

      case BottomNavItem.order:
        return OrderPage();

      case BottomNavItem.setting:
        return SettingPage();
    }
  }

  String _assetFor(BottomNavItem item) {
    switch (item) {
      case BottomNavItem.homePage:
        return ImagesStrings.homeSvg;
      case BottomNavItem.notification:
        return ImagesStrings.notificationSvg;
      case BottomNavItem.order:
        return ImagesStrings.orderSvg;
      case BottomNavItem.setting:
        return ImagesStrings.settingSvg;
    }
  }
}
