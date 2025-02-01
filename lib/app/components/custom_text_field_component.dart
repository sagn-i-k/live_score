import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/color_manager.dart';
import '../utils/text_style_manager.dart';

class CustomTextField extends StatelessWidget {
  final String labelText;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final bool obscureText;
  final String? Function(String?)? validator;

  const CustomTextField({
    Key? key,
    required this.labelText,
    required this.controller,
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
    this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: TextStyleManager.authTextStyle,
      controller: controller,
      decoration: InputDecoration(
          fillColor: Colors.black45,
          filled: true,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.5.r),
            borderSide: BorderSide(
                color: ColorManager.primaryAppColor1
            ),
          ),
          disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.5.r),
              borderSide: BorderSide(
                  color: ColorManager.primaryAppColor1
              )
          ),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.5.r),
              borderSide: BorderSide(
                  color: ColorManager.primaryAppColor1
              )
          ),
          enabled: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.5.r),
            borderSide: const BorderSide(
              color: Colors.blueGrey,
              width: 2,
            ),
          ),
          hintText: labelText,
          hintStyle: TextStyleManager.authTextStyle
      ),
      keyboardType: keyboardType,
      obscureText: obscureText,
      validator: validator,
    );
  }
}
