import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:football_app/app/components/custom_news_component.dart';
import 'package:football_app/app/components/custom_scedule_component.dart';
import 'package:football_app/app/components/custom_subheading_component.dart';
import 'package:football_app/app/utils/color_manager.dart';
import 'package:football_app/app/utils/string_manager.dart';
import 'package:football_app/app/utils/text_style_manager.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../components/custom_scoreboard_component.dart';
import '../../player_statistics/view/player_statistics_view.dart';
import '../controller/home_controller.dart';

class HomeView extends GetView<HomeController>{
  HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.primaryAppColor1,
      appBar: AppBar(
        backgroundColor: ColorManager.primaryAppColor1,
        leading: Image.asset("assets/icons/category_icon.png"),
        title: Text(StringManager.headingText,style: TextStyleManager.headingTextStyle,),
        actions: [
          Container(
          margin: EdgeInsets.only(right: 10),
            child: Image.asset("assets/icons/notifiction_icon.png"))],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 10.h),
            Obx(() {
              return controller.liveMatches.isEmpty
                  ? Center(child: Text(StringManager.defaultMatchText,style: TextStyleManager.purpleTextStyle,))
                  : CarouselSlider(
                options: CarouselOptions(
                  height: 150.h,
                  autoPlay: true,
                  enlargeCenterPage: true,
                  viewportFraction: 0.75,
                  enlargeFactor: 0.15,
                ),
                items: controller.liveMatches.map((match) {
                  return CustomScoreBoardComponent(
                    match: match,
                    onTap: () {
                      Get.toNamed('/match-statistics', arguments: match);
                    },
                  );
                }).toList(),
              );
            }),
            SizedBox(height: 20.h),

            CustomSubheading(labelText: StringManager.scheduleSubHeadingText),
            SizedBox(height: 5.h,),
            Obx(() {
              return controller.fixtures.isEmpty
                  ? Center(child: Text(StringManager.defaultScheduleText,style: TextStyleManager.purpleTextStyle,))
                  : Container(
                    height: 200.h,
                    child: ListView.builder(
                      itemCount: controller.fixtures.length,
                      itemBuilder: (context, index) {
                                      var match = controller.fixtures[index];
                                      return CustomScheduleComponent(
                                          teamOneName: match['team1'].toString(),
                                          teamTwoName: match['team2'].toString(),
                                          teamOneLogo: match['team1Logo'].toString(),
                                          teamTwoLogo: match['team2Logo'].toString(),
                                          date: match['date'].toString(),
                                          time: match['time'].toString()
                                      );
                                      },
                                  ),
                  );
            }),
            SizedBox(height: 20.h,),
            CustomSubheading(labelText: StringManager.newsHeadingText),
            SizedBox(height: 5.h,),
            Obx(() {
              return controller.news.isEmpty
                  ? Center(child: Text("No news available",style: TextStyleManager.purpleTextStyle,))
                  : Container(
                height: 350.h,
                child: ListView.builder(
                  itemCount: controller.news.length,
                  itemBuilder: (context, index) {
                    var news_element = controller.news[index];
                    return CustomNewsComponent(
                        titleText: news_element['newsTitle'].toString(),
                        newsImg: news_element['newsImg'].toString()
                    );
                  },
                ),
              );
            }),

          ],
        ),
      ),
    );
  }
}