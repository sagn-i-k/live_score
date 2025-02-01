import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'color_manager.dart';

class TextStyleManager {

  static final TextStyle graphTextStyle=GoogleFonts.poppins(
      fontSize: 14.sp,
      fontWeight: FontWeight.w400,
      color: ColorManager.whiteColor
  );


  static final TextStyle authHeadingTextStyle = GoogleFonts.poppins(
      fontWeight: FontWeight.w800,
      color: ColorManager.whiteColor,
      fontSize: 24.sp
  );


  static final TextStyle headingTextStyle = GoogleFonts.poppins(
      fontWeight: FontWeight.w800,
      color: ColorManager.whiteColor,
      fontSize: 22
  );

  static final TextStyle playerStatTextStyle = GoogleFonts.poppins(
      fontWeight: FontWeight.w800,
      color: ColorManager.whiteColor,
      fontSize: 20
  );

  static final TextStyle  standingTextStyleFour = GoogleFonts.poppins(
    fontSize: 11.sp,
    color: ColorManager.whiteColor,
    fontWeight: FontWeight.w400,
  );


  static final TextStyle authTextStyle = GoogleFonts.poppins(
    fontSize: 13.sp,
    color: ColorManager.whiteColor,
    fontWeight: FontWeight.w400,
  );

  static final TextStyle  fixtureTextStyle = GoogleFonts.poppins(
    fontSize: 13.sp,
    color: ColorManager.whiteColor,
    fontWeight: FontWeight.w400,
  );

  static final TextStyle  standingTextStyle = GoogleFonts.poppins(
    fontSize: 13.5.sp,
    color: ColorManager.whiteColor,
    fontWeight: FontWeight.w600,
  );

  static final TextStyle standingTextStyleTwo=GoogleFonts.poppins(
      fontSize: 19,
      fontWeight: FontWeight.w600,
      color: ColorManager.whiteColor
  );

  static final TextStyle standingTextStyleThree=GoogleFonts.poppins(
      fontSize: 17,
      fontWeight: FontWeight.w600,
      color: ColorManager.whiteColor
  );

  static final TextStyle greyTextStyle=GoogleFonts.poppins(
      fontSize: 17.5,
      fontWeight: FontWeight.w600,
      color: Colors.grey
  );

  static final TextStyle greyTextStyleTwo=GoogleFonts.poppins(
      fontSize: 17,
      fontWeight: FontWeight.w400,
      color: Colors.grey
  );

  static final TextStyle purpleTextStyle=GoogleFonts.poppins(
  fontSize: 17,
  fontWeight: FontWeight.w600,
  color: ColorManager.primaryAppColor2
  );


  static final TextStyle authTextStyleTwo = GoogleFonts.poppins(
    fontSize: 14.sp,
    color: Colors.black,
    fontWeight: FontWeight.w400,
  );

  static final TextStyle authTextStyletThree = GoogleFonts.poppins(
    fontSize: 14.sp,
    color: ColorManager.whiteColor,
    fontWeight: FontWeight.w400,
  );

  static final TextStyle authTextStyleFour = GoogleFonts.poppins(
    fontSize: 14.sp,
    color:ColorManager.primaryAppColor2,
    fontWeight: FontWeight.w400,
  );
}