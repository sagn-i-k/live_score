import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../utils/text_style_manager.dart';

class CustomScoreBoardComponent extends StatelessWidget {
  final Map<String, dynamic> match;
  final VoidCallback onTap;

  const CustomScoreBoardComponent({
    Key? key,
    required this.match,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 10.w),
        decoration: BoxDecoration(
          image: const DecorationImage(
              image: AssetImage("assets/images/live_card_img.png"),
              fit: BoxFit.cover),
          borderRadius: BorderRadius.circular(24.r),
          boxShadow: const [BoxShadow(color: Colors.black26, blurRadius: 5)],
        ),
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            SizedBox(height: 15.h),
            Text("${match['time']}", style: TextStyleManager.standingTextStyle),
            SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  match['team1Logo'],
                  width: 40.w,
                  height: 40.h,
                  fit: BoxFit.fitWidth,
                ),
                SizedBox(width: 20.w),
                Text(match['score'], style: TextStyleManager.headingTextStyle),
                SizedBox(width: 20.w),
                Image.asset(
                  match['team2Logo'],
                  width: 40.w,
                  height: 40.h,
                  fit: BoxFit.cover,
                ),
              ],
            ),
            SizedBox(height: 12.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "${match['scorers']['team1Scorers'].join(',\n')}",
                  style: TextStyleManager.standingTextStyleFour,
                ),
                SizedBox(width: 30.w),
                Text(
                  "${match['scorers']['team2Scorers'].join(',\n')}",
                  style: TextStyleManager.standingTextStyleFour,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
