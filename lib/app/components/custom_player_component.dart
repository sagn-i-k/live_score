import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/text_style_manager.dart';

class CustomPlayerComponent extends StatelessWidget {
  final String playerName;
  final String goals;
  const CustomPlayerComponent({super.key, required this.playerName, required this.goals});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 10.w),
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: Colors.grey.shade200,width: 0.2)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(flex: 5, child: Container(
              margin: EdgeInsets.only(left: 25.w),
              child: Text(playerName, style: TextStyleManager.standingTextStyle))),
          Expanded(child: Text(goals, style: TextStyleManager.standingTextStyle)),
        ],
      ),
    );
  }
}
