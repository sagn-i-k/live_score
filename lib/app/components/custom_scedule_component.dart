import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/text_style_manager.dart';

class CustomScheduleComponent extends StatelessWidget {
  final String teamOneName;
  final String teamTwoName;
  final String teamOneLogo;
  final String teamTwoLogo;
  final String date;
  final String time;
  const CustomScheduleComponent({super.key, required this.teamOneName, required this.teamTwoName, required this.teamOneLogo, required this.teamTwoLogo, required this.date, required this.time});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 50.h,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.r),
            color:Colors.black45
        ),
        margin: const EdgeInsets.symmetric(vertical: 5,horizontal: 10),
        //${match['team1']}
        child: Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(teamOneName,style: TextStyleManager.fixtureTextStyle,),
              Image.asset(teamOneLogo),
              Text("$date \n $time",textAlign:TextAlign.center,style: TextStyleManager.fixtureTextStyle,),
              Image.asset(teamTwoLogo),
              Text(teamTwoName,style: TextStyleManager.fixtureTextStyle,),
            ],
          ),
        )
    );
  }
}
