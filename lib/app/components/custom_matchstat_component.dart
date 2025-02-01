import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:football_app/app/utils/text_style_manager.dart';

class MatchStatComponent extends StatelessWidget {
  final String label;
  final dynamic team1Value;
  final dynamic team2Value;

  const MatchStatComponent({
    Key? key,
    required this.label,
    required this.team1Value,
    required this.team2Value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5.h,horizontal: 10.w),
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Text(
              "$team1Value",
              textAlign: TextAlign.left,
              style: TextStyleManager.standingTextStyleThree,
            ),
          ),
          Text(
            label,
            style: TextStyleManager.greyTextStyle,
          ),
          Expanded(
            child: Text(
              "$team2Value",
              textAlign: TextAlign.right,
              style: TextStyleManager.standingTextStyleThree,
            ),
          ),
        ],
      ),
    );
  }
}
