import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:football_app/app/utils/color_manager.dart';
import 'package:football_app/app/utils/text_style_manager.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../auth/controller/auth_controller.dart';

class ProfileView extends StatelessWidget {
  ProfileView({super.key});
  final AuthController controller = Get.put(AuthController());
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: ColorManager.primaryAppColor1,
      appBar: AppBar(
        backgroundColor: ColorManager.primaryAppColor1,
        title: Text("Profile",style: TextStyleManager.headingTextStyle,),
        centerTitle: true,
      ),
      body: Center(
        child: InkWell(
          onTap: (){
            controller.logout();
          },
          child: Container(
            width: 200.w,
            height: 40.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.r),
              gradient: LinearGradient(
                colors: [Color(0xFF4568DC).withOpacity(0.7), Color(0xFF4568DC).withOpacity(0.7)], // Replace with your desired colors
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              ),
            ),
            child:Center(child: Text("Log Out",style: TextStyleManager.headingTextStyle,)) ,
          ),
        ),
      ),
    );
  }
}
