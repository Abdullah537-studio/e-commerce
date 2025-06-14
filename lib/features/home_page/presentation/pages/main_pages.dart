import 'package:e_commerce_app/core/constant/app_colors.dart';
import 'package:e_commerce_app/core/enum/bottom_nav_item.dart';
import 'package:e_commerce_app/core/strings/images_strings.dart';
import 'package:e_commerce_app/core/widgets/main_scaffold.dart';
import 'package:e_commerce_app/features/home_page/presentation/pages/home_page.dart';
import 'package:e_commerce_app/features/home_page/presentation/pages/notification_page.dart';
import 'package:e_commerce_app/features/home_page/presentation/pages/order_page.dart';
import 'package:e_commerce_app/features/home_page/presentation/pages/setting_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class MainPages extends StatelessWidget {
  const MainPages({super.key});

  @override
  Widget build(BuildContext context) {
    BottomNavItem bottomNabItem = BottomNavItem.HomePage;
    Widget? page = HomePage();
    switch (bottomNabItem) {
      case BottomNavItem.HomePage:
        page = HomePage();

      case BottomNavItem.Notification:
        page = NotificationPage();

      case BottomNavItem.Order:
        page = OrderPage();

      case BottomNavItem.Setting:
        page = SettingPage();
    }

    return MainScaffold(
      body: page,
      bottomNavigationBar: SizedBox(
        width: double.infinity,
        height: 80.h,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            GestureDetector(
              onTap: () {
                bottomNabItem = BottomNavItem.HomePage;
              },
              child: SvgPicture.asset(ImagesStrings.homeSvg),
            ),
            GestureDetector(
              onTap: () {
                bottomNabItem = BottomNavItem.Notification;
              },
              child: SvgPicture.asset(ImagesStrings.notificationSvg),
            ),
            GestureDetector(
              onTap: () {
                bottomNabItem = BottomNavItem.Order;
              },
              child: SvgPicture.asset(ImagesStrings.orderSvg),
            ),
            GestureDetector(
              onTap: () {
                bottomNabItem = BottomNavItem.Setting;
              },
              child: SvgPicture.asset(ImagesStrings.settingSvg),
            ),
          ],
        ),
      ),
      //  BottomNavigationBar(
      //   currentIndex: _currentIndex,
      //   onTap: (i) => setState(() => _currentIndex = i),
      //   items: [
      //     BottomNavigationBarItem(
      //       icon: Tab(
      //         child: SvgPicture.asset(
      //           ImagesStrings.homeSvg,
      //           colorFilter: ColorFilter.mode(
      //             _currentIndex == 0
      //                 ? AppColors.primaryColor
      //                 : Colors.black, // اللون اللي تبيه
      //             BlendMode.srcIn, // نمط الدمج
      //           ),
      //         ),
      //       ),
      //       label: "home page",
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Tab(
      //         child: SvgPicture.asset(
      //           ImagesStrings.notificationSvg,
      //           colorFilter: ColorFilter.mode(
      //             _currentIndex == 1
      //                 ? AppColors.primaryColor
      //                 : Colors.black, // اللون اللي تبيه
      //             BlendMode.srcIn, // نمط الدمج
      //           ),
      //         ),
      //       ),
      //       label: "Notification page",
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Tab(
      //         child: SvgPicture.asset(
      //           ImagesStrings.orderSvg,
      //           colorFilter: ColorFilter.mode(
      //             _currentIndex == 2
      //                 ? AppColors.primaryColor
      //                 : Colors.black, // اللون اللي تبيه
      //             BlendMode.srcIn, // نمط الدمج
      //           ),
      //         ),
      //       ),
      //       label: "order page",
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Tab(
      //         child: SvgPicture.asset(
      //           ImagesStrings.settingSvg,
      //           colorFilter: ColorFilter.mode(
      //             _currentIndex == 3
      //                 ? AppColors.primaryColor
      //                 : Colors.black, // اللون اللي تبيه
      //             BlendMode.srcIn, // نمط الدمج
      //           ),
      //         ),
      //       ),
      //       label: "setting page",
      //     ),
      //   ],
      // ),
    );
  }
}
