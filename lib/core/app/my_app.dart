import 'package:e_commerce_app/features/home_page/presentation/pages/home_page.dart';
import 'package:e_commerce_app/features/home_page/presentation/pages/main_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(390, 840),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          debugShowMaterialGrid: false,

          title: 'E-Commerce App',

          // onGenerateRoute: AppRouter.onGenerateRoute,
          home: MainPages(),
        );
      },
    );
  }
}
