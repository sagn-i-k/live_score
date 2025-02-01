import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:football_app/app/components/custom_hexagon_component.dart';
import 'package:football_app/app/utils/color_manager.dart';
import 'package:football_app/app/utils/string_manager.dart';
import 'package:football_app/app/utils/text_style_manager.dart';
import 'package:get/get.dart';
import 'package:fl_chart/fl_chart.dart';
import '../../../components/custom_graph_componet.dart';
import '../controller/player_statistic_controller.dart';

class PlayerStatisticsView extends GetView<PlayerStatisticsController> {
  const PlayerStatisticsView({super.key});

  @override
  Widget build(BuildContext context) {
    final hexWidth=MediaQuery.of(context).size.width*0.8;
    return Scaffold(
      backgroundColor: ColorManager.primaryAppColor1,
      appBar:AppBar(
        backgroundColor: ColorManager.primaryAppColor1,
        leading: InkWell(
          onTap: (){
            Get.back();
          },
            child: Icon(Icons.arrow_back_ios,size :20.sp,color: ColorManager.whiteColor,)),
        centerTitle: true,
        title: Text(StringManager.playerStatText,style: TextStyleManager.headingTextStyle,),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 20.h),
            Container(
             margin: EdgeInsets.symmetric(horizontal: 10.w),
             child: Row(
               children: [
                 CircleAvatar(
                   radius: 19.r,
                   backgroundColor: ColorManager.playerStatColor,
                 ),
                 SizedBox(width: 20.w,),
                 Text(controller.playerName.toString(),style: TextStyleManager.playerStatTextStyle,),
                 SizedBox(width: MediaQuery.of(context).size.width*0.45,),
                 Stack(
                  children: [
                    Image.asset("assets/icons/hexa_icon.png",width: 30.w,height: 30.h,fit: BoxFit.cover,),
                    Positioned(
                        top: 8.h,
                        left: 7.w,
                        child: Text(controller.avgPoint.toString(),style: TextStyleManager.standingTextStyleFour,)),
                  ],
                )

               ],
             ),
           ),
            SizedBox(height: 20.h),
            Container(
              margin: EdgeInsets.only(left: 15.w),
              child: Row(
                children: [
                  Row(
                    children: [
                      Text(StringManager.appearanceText,style: TextStyleManager.greyTextStyleTwo,),
                      SizedBox(width: 5.w,),
                      Text(controller.appear.toString(),style: TextStyleManager.standingTextStyleThree,)
                    ],
                  ),
                  SizedBox(width: 15.w,),
                  Row(
                    children: [
                      Text(StringManager.minuteText,style: TextStyleManager.greyTextStyleTwo,),
                      SizedBox(width: 5.w,),
                      Text(controller.minute.toString(),style: TextStyleManager.standingTextStyleThree)
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 10.h),
            Container(
              margin: EdgeInsets.only(left: 15.w),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      Text(StringManager.pGoalsText,style: TextStyleManager.greyTextStyleTwo,),
                      SizedBox(width: 5.w,),
                      Text(controller.penalty.toString(),style: TextStyleManager.standingTextStyleThree)
                    ],
                  ),
                  SizedBox(width: 15.w,),
                  Row(
                    children: [
                      Text(StringManager.assistText,style: TextStyleManager.greyTextStyleTwo,),
                      SizedBox(width: 5.w,),
                      Text(controller.assist.toString(),style: TextStyleManager.standingTextStyleThree)
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 10.h),
            Container(
              height: 310.h,
              color: ColorManager.tabColor.withOpacity(0.05),
              child: Column(
               children: [
                 Container(
                   margin: EdgeInsets.symmetric(horizontal: 15.w,vertical: 10.h),
                   child: Row(
                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                     children: [
                       Text(StringManager.performText,style: TextStyleManager.standingTextStyleTwo,),
                       Container(
                         width: 120.w,
                         height: 30.h,
                         decoration: BoxDecoration(
                             borderRadius: BorderRadius.circular(4.5.r),
                             border: Border.all(color: ColorManager.whiteColor,width: 0.5)
                         ),
                         child: Center(
                           child: Row(
                             crossAxisAlignment: CrossAxisAlignment.center,
                             mainAxisAlignment: MainAxisAlignment.center,
                             children: [
                               Text(StringManager.seasonText,
                                 style: TextStyleManager.fixtureTextStyle,),
                               Icon(Icons.arrow_drop_down_rounded,color: ColorManager.whiteColor,)
                             ],
                           ),
                         ),
                       )
                     ],
                   ),
                 ),
                 SizedBox(height: 10.h),
                 CustomGraphComponent(graphData: controller.graphData),
                 SizedBox(height: 5.h),
                 Row(
                   mainAxisAlignment: MainAxisAlignment.spaceAround,
                   children: [
                     Text("Apr 22",style: TextStyleManager.graphTextStyle,),
                     Text("May 22",style: TextStyleManager.graphTextStyle,),
                     Text("Jun 22",style: TextStyleManager.graphTextStyle,),
                     Text("Jul 22",style: TextStyleManager.graphTextStyle,),
                     Text("Aug 22",style: TextStyleManager.graphTextStyle,),
                     Text("Sep 22",style: TextStyleManager.graphTextStyle,),
                   ],
                 )
               ],
              ),
            ),
            SizedBox(height: 15.h),
            Container(
              //290
              height: 40.h,
              width: MediaQuery.of(context).size.width,
              color: ColorManager.tabColor.withOpacity(0.05),
              child: Column(
                children: [
                  SizedBox(height: 12.h),
                  Align(
                    alignment: Alignment.centerLeft,
                      child: Container(
                        margin: EdgeInsets.only(left: 15.h),
                          child: Text(StringManager.roleText,style: TextStyleManager.standingTextStyleTwo,))),
                ],
              ),

            ),
            Container(
                width: MediaQuery.of(context).size.width,
                height: 320.h,
                color: ColorManager.tabColor.withOpacity(0.05),
                child: Hexagon(screenWidth:MediaQuery.of(context).size.width)),
            SizedBox(height: 50.h),



          ],
        ),
      ),
    );
  }
}






