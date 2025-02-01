import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/text_style_manager.dart';

class CustomStandingComponent extends StatelessWidget {
  final String imagePath;
  final String teamName;
  final String win;
  final String loss;
  final String draw;
  final String points;
  final String isGood;

  const CustomStandingComponent({super.key, required this.imagePath, required this.teamName, required this.win, required this.loss, required this.draw, required this.points, required this.isGood});

  @override
  Widget build(BuildContext context) {
    return Container(
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
                  backgroundColor: isGood == 'G' ? Colors.blue : Colors.yellow,
                  radius: 3.r,
                ),
                SizedBox(width: 8.w),
                Image.asset(imagePath),
                SizedBox(width: 8.w),
                Text(teamName, style: TextStyleManager.standingTextStyle),
              ],
            ),
          ),
          Expanded(child: Text(win, style: TextStyleManager.standingTextStyle)),
          Expanded(child: Text(loss, style: TextStyleManager.standingTextStyle)),
          Expanded(child: Text(draw, style: TextStyleManager.standingTextStyle)),
          Expanded(child: Text(points.toString(), style: TextStyleManager.standingTextStyle)),
        ],
      ),
    );
  }
}
