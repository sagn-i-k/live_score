import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:football_app/app/modules/home/view/home_view.dart';
import 'package:football_app/app/utils/routes_manager.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (context,child){
        return GetMaterialApp(
            debugShowCheckedModeBanner: false,
            initialRoute: AppRoutes.splash,
            getPages: AppRoutes.routes,
        );
      },
    );
  }
}


