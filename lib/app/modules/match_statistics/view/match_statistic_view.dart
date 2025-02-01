import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:football_app/app/utils/color_manager.dart';
import 'package:get/get.dart';
import '../../../components/custom_matchstat_component.dart';
import '../../../utils/string_manager.dart';
import '../../../utils/text_style_manager.dart';
import '../controller/match_statistic_controller.dart';


class MatchStatisticsView extends GetView<MatchStatisticsController> {
  MatchStatisticsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Obx(() {
        var match = controller.matchData;

        if (match.isEmpty) {
          return const Center(child: Text("No match details available"));
        }

        var team1Stats = match['stats']['team1'];
        var team2Stats = match['stats']['team2'];

        return Container(
          padding: const EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage("assets/images/match_stat_img.png"),fit: BoxFit.cover)
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.symmetric(horizontal: 10.w,vertical: 30.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap:(){
                        Get.back();
                      },
                        child: Icon(Icons.arrow_back_ios,color: ColorManager.whiteColor,size: 20.sp,)),
                    Text(StringManager.fScoreText,style: TextStyleManager.headingTextStyle,),
                    Image.asset("assets/icons/i_icon_2.png",width: 22.w,height: 22.h,color: ColorManager.whiteColor,fit: BoxFit.contain,)
                  ],
                ),
              ),
                SizedBox(height: 20.h,),
              // Team Logos & Score
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(match['team1Logo'], width: 65.w, height: 65.h,fit: BoxFit.cover,),
                  SizedBox(width: 35.w),
                  Text(match['score'], style: TextStyleManager.standingTextStyleTwo),
                  SizedBox(width: 35.w),
                  Image.asset(match['team2Logo'], width: 65.w, height: 65.h,fit: BoxFit.cover,),
                ],
              ),
              SizedBox(height: 15.h),

              // Scorers
              Container(
                margin: EdgeInsets.symmetric(horizontal: 10.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(child: Text("${match['scorers']['team1Scorers'].join(',\n')}",
                      textAlign: TextAlign.left,
                      style: TextStyleManager.standingTextStyleThree,)),
                    Expanded(child: Text("${match['scorers']['team2Scorers'].join(',\n')}",
                      textAlign: TextAlign.right,
                      style: TextStyleManager.standingTextStyleThree,)),
                  ],
                ),
              ),
              SizedBox(height: 25.h),

              // Match Statistics
              Align(
                alignment: Alignment.center,
                  child: Text("Match Statistics", style: TextStyleManager.standingTextStyleTwo)),

              SizedBox(height: 10.h),
              MatchStatComponent(label: "Shots", team1Value: team1Stats['shots'], team2Value: team2Stats['shots']),
              MatchStatComponent(label: "Shots on Target", team1Value: team1Stats['shotsOnTarget'], team2Value: team2Stats['shotsOnTarget']),
              MatchStatComponent(label: "Possession", team1Value: team1Stats['possession'], team2Value: team2Stats['possession']),
              MatchStatComponent(label: "Passes", team1Value: team1Stats['passes'], team2Value: team2Stats['passes']),
              MatchStatComponent(label: "Pass Accuracy", team1Value: team1Stats['passAccuracy'], team2Value: team2Stats['passAccuracy']),
              MatchStatComponent(label: "Fouls", team1Value: team1Stats['fouls'], team2Value: team2Stats['fouls']),
              MatchStatComponent(label: "Yellow Cards", team1Value: team1Stats['yellowCards'], team2Value: team2Stats['yellowCards']),
              MatchStatComponent(label: "Red Cards", team1Value: team1Stats['redCards'], team2Value: team2Stats['redCards']),
              MatchStatComponent(label: "Offsides", team1Value: team1Stats['offsides'], team2Value: team2Stats['offsides']),
              MatchStatComponent(label: "Corners", team1Value: team1Stats['corners'], team2Value: team2Stats['corners']),
            ],
          ),
        );
      }),
    );
  }
}
