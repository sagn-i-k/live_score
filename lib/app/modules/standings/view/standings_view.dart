import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:football_app/app/components/custom_player_component.dart';
import 'package:football_app/app/components/custom_standing_component.dart';
import 'package:football_app/app/components/custom_subheading_component.dart';
import 'package:football_app/app/utils/color_manager.dart';
import 'package:football_app/app/utils/string_manager.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../utils/text_style_manager.dart';
import '../controller/standings_controller.dart';


class StandingsView extends GetView<StandingsController> {
  StandingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.primaryAppColor1,
      appBar: AppBar(
        title: Text(StringManager.standingHeadingText, style: TextStyleManager.headingTextStyle),
        backgroundColor: ColorManager.primaryAppColor1,
      ),
      body:SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 10.h,),
            //Standings
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10.w),
              padding: const EdgeInsets.symmetric(horizontal: 8,vertical: 10),
              height: 270.h,
              decoration: BoxDecoration(
                color: ColorManager.primaryAppColor3,
                borderRadius: BorderRadius.circular(10.r),
              ),
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 10.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(StringManager.standingSubHeadingText,style: TextStyleManager.standingTextStyleTwo,),
                        Obx(
                              ()=> TextButton(
                            onPressed: () => controller.toggleShowAll(),
                            child: Text(controller.showAll.value ? "Show Less" : "See All", style: TextStyleManager.purpleTextStyle),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height:10.h),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(flex: 4, child: Text("Club", style: TextStyleManager.standingTextStyle)),
                        Expanded(child: Text("W", style: TextStyleManager.standingTextStyle)),
                        Expanded(child: Text("L", style: TextStyleManager.standingTextStyle)),
                        Expanded(child: Text("D", style: TextStyleManager.standingTextStyle)),
                        Expanded(child: Text("Point", style: TextStyleManager.standingTextStyle)),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Obx(() {
                      var displayedStandings = controller.showAll.value
                          ? controller.standings
                          : controller.standings.take(4).toList();

                      return Column(
                        children: [
                          Expanded(
                            child: ListView.builder(
                              itemCount: displayedStandings.length,
                              itemBuilder: (context, index) {
                                var team = displayedStandings[index];
                                return CustomStandingComponent(
                                    imagePath: "assets/icons/team_1_icon.png",
                                    teamName: team["team"].toString(),
                                    win: team["win"].toString(),
                                    loss: team["lose"].toString(),
                                    draw: team["draw"].toString(),
                                    points:team["points"].toString(),
                                    isGood: team["rem"].toString()
                                );
                              },
                            ),
                          ),
                        ],
                      );
                    }),
                  ),
                ],
              ),
            ),
            SizedBox(height: 15.h,),
            //Goals
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10.w),
              padding: const EdgeInsets.symmetric(horizontal: 8,vertical: 10),
              height: 295.h,
              decoration: BoxDecoration(
                color: ColorManager.primaryAppColor3,
                borderRadius: BorderRadius.circular(10.r),
              ),
              child:Column(
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 10.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(StringManager.scoredText,style: TextStyleManager.standingTextStyleTwo),
                        Obx(
                              ()=> TextButton(
                            onPressed: () => controller.toggleShowAllScorers(),
                            child: Text(controller.showAllScorers.value ? "Show Less" : "See All", style: TextStyleManager.purpleTextStyle),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10.h),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(flex: 5, child: Text(StringManager.playersText, style: TextStyleManager.standingTextStyleThree)),
                        Expanded(child: Text(StringManager.goalsText, style: TextStyleManager.standingTextStyleThree)),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Obx(() {
                      var displayedScorers = controller.showAllScorers.value
                          ? controller.topScorers
                          : controller.topScorers.take(4).toList();

                      return Column(
                        children: [
                          Expanded(
                            child: ListView.builder(
                              itemCount: displayedScorers.length,
                              itemBuilder: (context, index) {
                                var player = displayedScorers[index];
                                return InkWell(
                                  onTap: (){
                                    Get.toNamed("/player-statistics", arguments: {"playerData": player});
                                  },
                                  child: CustomPlayerComponent(
                                      playerName: player['player'].toString(),
                                      goals: player['goals'].toString()
                                  ),
                                ) ;
                              },
                            ),
                          ),
                        ],
                      );
                    }),
                  ),
                ],
              ),
            ),
            SizedBox(height: 15.h,),
           
          ],
        ),
      ),
    );
  }
}
/*
Container(
                                  padding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 10.w),
                                  decoration: BoxDecoration(
                                    border: Border(bottom: BorderSide(color: Colors.grey.shade200,width: 0.2)),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(flex: 5, child: Container(
                                          margin: EdgeInsets.only(left: 25.w),
                                          child: Text(player["player"], style: TextStyleManager.standingTextStyle))),
                                      Expanded(child: Text(player["goals"].toString(), style: TextStyleManager.standingTextStyle)),
                                    ],
                                  ),
                                )
Container(
                                  padding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                                  decoration: BoxDecoration(
                                    border: Border(bottom: BorderSide(color: Colors.grey.shade200,width: 0.2)),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                        flex: 4,
                                        child: Row(
                                          children: [
                                            CircleAvatar(
                                              backgroundColor: team["rem"] == 'G' ? Colors.blue : Colors.yellow,
                                              radius: 3.r,
                                            ),
                                            SizedBox(width: 8.w),
                                            Image.asset("assets/icons/team_1_icon.png"),
                                            SizedBox(width: 8.w),
                                            Text(team["team"], style: TextStyleManager.standingTextStyle),
                                          ],
                                        ),
                                      ),
                                      Expanded(child: Text(team["win"].toString(), style: TextStyleManager.standingTextStyle)),
                                      Expanded(child: Text(team["lose"].toString(), style: TextStyleManager.standingTextStyle)),
                                      Expanded(child: Text(team["draw"].toString(), style: TextStyleManager.standingTextStyle)),
                                      Expanded(child: Text(team["points"].toString(), style: TextStyleManager.standingTextStyle)),
                                    ],
                                  ),
                                )
 */