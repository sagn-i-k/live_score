import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/color_manager.dart';
import '../utils/string_manager.dart';
import '../utils/text_style_manager.dart';

class LoadingSection extends StatelessWidget {
  final String? message;

  const LoadingSection({
    super.key,
    this.message,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            StringManager.loadImgText,
            style: TextStyleManager.headingTextStyle,
          ),
          SizedBox(height: 5.h),
          CircularProgressIndicator(
            backgroundColor: ColorManager.primaryAppColor2,
          ),
        ],
      ),
    );
  }
}


class CustomImageItem extends StatelessWidget {
  final String imageUrl;

  const CustomImageItem({
    super.key,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12.5.r),
      child: Image.network(
        imageUrl,
        fit: BoxFit.cover,
        loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
          if (loadingProgress == null) {
            return child;
          }
          return Center(
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: ColorManager.primaryAppColor2,
                ),
                borderRadius: BorderRadius.circular(12.5.r),
              ),
              child: Image.asset(
                "assets/images/default_img.png",
                fit: BoxFit.cover,
              ),
            ),
          );
        },
        errorBuilder: (context, error, stackTrace) {
          return Container(
            decoration: BoxDecoration(
              color: ColorManager.primaryAppColor2,
              borderRadius: BorderRadius.circular(12.5.r),
            ),
            child: Image.asset(
              "assets/images/default_img.png",
              fit: BoxFit.cover,
            ),
          );
        },
      ),
    );
  }
}