import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:football_app/app/utils/asset_manager.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../components/custom_text_field_component.dart';
import '../../../utils/color_manager.dart';
import '../../../utils/string_manager.dart';
import '../../../utils/text_style_manager.dart';
import '../controller/auth_controller.dart';

class SignupView extends StatelessWidget {
  final AuthController authController = Get.put(AuthController());
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();
  final TextEditingController fullNameController = TextEditingController();
  final GlobalKey<FormState> signupFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.primaryAppColor1,
      appBar: AppBar(
        backgroundColor: ColorManager.primaryAppColor1,
        title: Text(StringManager.signUpText,style: TextStyleManager.headingTextStyle,),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: signupFormKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 25.h,),
                Text(StringManager.fullNameText,style: TextStyleManager.standingTextStyleThree,),
                SizedBox(height: 5.h,),
                CustomTextField(
                  labelText: 'Enter your full name',
                  controller: fullNameController,
                  keyboardType: TextInputType.name,
                  validator: (value) => value == null || value.isEmpty
                      ? 'Full name is required'
                      : null,
                ),


                SizedBox(height: 15.h),
                Text(StringManager.emailText,style: TextStyleManager.standingTextStyleThree,),
                SizedBox(height: 5.h,),
                CustomTextField(
                  labelText: 'Enter your email',
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  validator: authController.validateEmail,
                ),

                SizedBox(height: 15.h),
                Text(StringManager.passwordText,style: TextStyleManager.standingTextStyleThree,),
                SizedBox(height: 5.h,),
                CustomTextField(
                  labelText: 'Enter your password',
                  controller: passwordController,
                  obscureText: true,
                  validator: authController.validatePassword,
                ),

                SizedBox(height: 15.h),
                Text(StringManager.cPasswordText,style: TextStyleManager.standingTextStyleThree,),
                SizedBox(height: 5.h,),
                CustomTextField(
                  labelText: 'Confirm your password',
                  controller: confirmPasswordController,
                  obscureText: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Confirm Password is required';
                    } else if (value != passwordController.text) {
                      return 'Passwords do not match';
                    }
                    return null;
                  },
                ),


                SizedBox(height: 22.h),

                InkWell(
                  onTap: (){
                        if (signupFormKey.currentState?.validate() ?? false) {
                          authController.signUp(
                            emailController.text,
                            passwordController.text,
                          );
                        }
                  },
                  child: Container(
                    //margin: EdgeInsets.symmetric(horizontal: 10.w),
                    height: 40.h,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.r),
                      gradient: LinearGradient(
                        colors: [Color(0xFF4568DC).withOpacity(0.7), Color(0xFF4568DC).withOpacity(0.7)], // Replace with your desired colors
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                      ),
                    ),
                    child: Center(child: Text(StringManager.signUpText,style: TextStyleManager.authTextStyletThree,),),
                  ),
                ),
                SizedBox(height: 15.h,),
                Center(child: Text(StringManager.socialSignupText,style: TextStyleManager.standingTextStyleThree,)),
                SizedBox(height: 15.h,),
                Container(
                  margin: EdgeInsets.symmetric(
                      horizontal: 12.w
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: 40.h,
                        width: 150.w,
                        decoration: BoxDecoration(
                            color: Color(0xFF003B87),
                            borderRadius: BorderRadius.circular(6.5.r)
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              margin: EdgeInsets.symmetric(horizontal: 5.w),
                              width: 25.w,
                              height: 25.h,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  //color: Colors.red,
                                  image: DecorationImage(image: AssetImage(AssetManager.facebookIcon))
                              ),
                            ),
                            SizedBox(width: 15.w,),
                            Text("Facebook",style: TextStyleManager.graphTextStyle,)
                          ],
                        ),
                      ),
                      Container(
                        height: 40.h,
                        width: 150.w,
                        decoration: BoxDecoration(
                            color: ColorManager.tabColorTwo,
                            borderRadius: BorderRadius.circular(6.5.r)
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              margin: EdgeInsets.symmetric(horizontal: 5.w),
                              width: 25.w,
                              height: 25.h,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  //color: Colors.red,
                                  image: DecorationImage(image: AssetImage(AssetManager.googleIcon))
                              ),
                            ),
                            SizedBox(width: 15.w,),
                            Text("Google",style: TextStyleManager.graphTextStyle,)
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 35.h,),
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(StringManager.alreadyAccountText,
                        style: TextStyleManager.greyTextStyleTwo,),

                      InkWell(
                          onTap: (){
                            Get.toNamed('/sign-in');
                          },
                          child: Text(StringManager.pSignInText,
                            style: TextStyleManager.standingTextStyleThree,)),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}