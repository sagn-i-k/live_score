import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utils/color_manager.dart';

class CustomSubheading extends StatelessWidget {
  final String labelText;
  const CustomSubheading({super.key, required this.labelText});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(labelText,style: GoogleFonts.poppins(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: ColorManager.whiteColor
          ),),
          Text("See all",style :GoogleFonts.poppins(
              fontSize: 17,
              fontWeight: FontWeight.w600,
              color: ColorManager.primaryAppColor2
          ))
        ],
      ),
    );
  }
}
