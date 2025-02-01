import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:football_app/app/modules/home/view/home_view.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../utils/color_manager.dart';
import '../../auth/views/login_view.dart';
import '../controller/splash_controller.dart';

class SplashView extends GetView<SplashController> {

  SplashView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.primaryAppColor1,
      body: Center(
        child: Obx(() => AnimatedSwitcher(
          duration: const Duration(milliseconds: 300),
          child: Text(
            controller.displayedText.value,
            key: ValueKey(controller.displayedText.value),
            style: GoogleFonts.poppins(fontSize: 35, fontWeight: FontWeight.bold,color: ColorManager.primaryAppColor2),
          ),
        )),
      ),
    );
  }
}




// class SplashScreen extends StatefulWidget {
//   @override
//   _SplashScreenState createState() => _SplashScreenState();
// }
//
// class _SplashScreenState extends State<SplashScreen> {
//   String word = "APP";
//   String displayedText = "LIVESCORE ";
//   int index = 0;
//   Timer? _timer;
//
//   @override
//   void initState() {
//     super.initState();
//     startLetterAnimation();
//     navigateAfterDelay();
//   }
//
//
//   void startLetterAnimation() {
//     _timer = Timer.periodic(Duration(milliseconds: 300), (timer) {
//       if (index < word.length) {
//         setState(() {
//           displayedText += word[index];
//           index++;
//         });
//       } else {
//         _timer?.cancel();
//       }
//     });
//   }
//
//   // Navigate after a delay
//   void navigateAfterDelay() async {
//     await Future.delayed(Duration(seconds: 5)); // Adjust delay for animation
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     bool isLoggedIn = prefs.getBool('isLoggedIn') ?? false;
//
//     if (isLoggedIn) {
//       Get.offAll(() => HomeView());
//     } else {
//       Get.offAll(() => LoginView());
//     }
//   }
//
//   @override
//   void dispose() {
//     _timer?.cancel();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: ColorManager.primaryAppColor1,
//       body: Center(
//         child: AnimatedSwitcher(
//           duration: Duration(milliseconds: 300),
//           child: Text(
//             displayedText,
//             key: ValueKey(displayedText),
//             style: GoogleFonts.poppins(fontSize: 35, fontWeight: FontWeight.bold),
//           ),
//         ),
//       ),
//     );
//   }
// }