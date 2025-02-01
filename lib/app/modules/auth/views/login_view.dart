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

class LoginView extends StatelessWidget {

  final AuthController authController = Get.put(AuthController());
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.primaryAppColor1,
      appBar: AppBar(
        backgroundColor: ColorManager.primaryAppColor1,
        title: Text(StringManager.signInText,style: TextStyleManager.headingTextStyle,),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.symmetric(
              horizontal: 12.w
          ),
          child: Form(
            key: loginFormKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 25.h,),
                Container(
                height: 140.h,
                decoration: BoxDecoration(
                  image: DecorationImage(image: AssetImage("assets/images/auth_img.png",),fit: BoxFit.cover)
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 10.h,),
                    Text("Welcome to \nLiveScore",style: TextStyleManager.authHeadingTextStyle,),
                    SizedBox(height: 10.h,),
                    Text("Enter your email address and password to use the application",style: TextStyleManager.standingTextStyleTwo,),
                  ],
                ),
                                  ),

                Text(StringManager.emailText,style: TextStyleManager.standingTextStyleThree,),
                SizedBox(height: 5.h,),
                CustomTextField(
                  labelText: 'Enter your email',
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  validator: authController.validateEmail,
                ),

                SizedBox(height: 20.h,),

                Text(StringManager.passwordText,style: TextStyleManager.standingTextStyleThree,),
                SizedBox(height: 5.h,),
                CustomTextField(
                  labelText: 'Enter your password',
                  controller: passwordController,
                  obscureText: true,
                  validator: authController.validatePassword,
                ),


                SizedBox(height: 30.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Text("Remember Me",style: TextStyleManager.authTextStyle,),
                        SizedBox(width: 8),
                        GestureDetector(
                          onTap: authController.toggleCheck,
                          child: Obx(
                                () => Container(
                              width: 24,
                              height: 24,
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.white, width: 1),
                                borderRadius: BorderRadius.circular(4), // Square shape
                                color: authController.isChecked.value ? Colors.blue : Colors.transparent,
                              ),
                              child: authController.isChecked.value
                                  ? Icon(Icons.check, color: Colors.white, size: 12.sp)
                                  : null,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Text(StringManager.forgotText,style: TextStyleManager.authTextStyle,),
                  ],
                ),

                SizedBox(height: 8.h,),
                InkWell(
                  onTap: (){
                    if (loginFormKey.currentState?.validate() ?? false) {
                      authController.login(
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
                    child: Center(child: Text(StringManager.signInText,style: TextStyleManager.authTextStyletThree,),),
                  ),
                ),
                SizedBox(height: 15.h,),
                Center(child: Text(StringManager.socialSigninText,style: TextStyleManager.standingTextStyleThree,)),
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
                      Text(StringManager.doesNotAccountText,
                        style: TextStyleManager.greyTextStyleTwo,),

                      InkWell(
                          onTap: (){
                            Get.toNamed('/sign-up');
                          },
                          child: Text(StringManager.pSignUpText,
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