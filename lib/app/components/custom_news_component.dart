import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/text_style_manager.dart';

class CustomNewsComponent extends StatelessWidget {
  final String titleText;
  final String newsImg;
  const CustomNewsComponent({super.key, required this.titleText, required this.newsImg});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 70.h,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.r),
            color:Colors.black45
        ),
        margin: const EdgeInsets.symmetric(vertical: 5,horizontal: 10),
        //${match['team1']}
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 10.w),
          padding: EdgeInsets.symmetric(horizontal: 2.w,vertical: 10.h),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 80.w,
                height: 80.h,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.5.r),
                    image: DecorationImage(image: AssetImage(newsImg,),fit: BoxFit.fitWidth)
                ),
              ),
              SizedBox(width: 15.w,),
              Text(titleText,style: TextStyleManager.fixtureTextStyle,textAlign: TextAlign.left,softWrap: true,overflow: TextOverflow.ellipsis,),
              SizedBox(width: 10.w,),
              Image.asset("assets/icons/bookmarks_icon.png")

            ],
          ),
        )
    );
  }
}
