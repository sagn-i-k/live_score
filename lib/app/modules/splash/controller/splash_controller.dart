import 'dart:async';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../utils/routes_manager.dart';


class SplashController extends GetxController {
  var displayedText = "LIVE".obs;
  final String word = "SCORE";
  int index = 0;
  Timer? _timer;

  @override
  void onInit() {
    super.onInit();
    startLetterAnimation();
    navigateAfterDelay();
  }

  void startLetterAnimation() {
    _timer = Timer.periodic(const Duration(milliseconds: 300), (timer) {
      if (index < word.length) {
        displayedText.value += word[index];
        index++;
      } else {
        _timer?.cancel();
      }
    });
  }

  void navigateAfterDelay() async {
    await Future.delayed(const Duration(seconds: 5)); // Adjust delay for animation
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isLoggedIn = prefs.getBool('isLoggedIn') ?? false;

    if (isLoggedIn) {
      //Get.offAllNamed(AppRoutes.signIn);
      Get.offAllNamed(AppRoutes.bottomNavBar);
    } else {
      Get.offAllNamed(AppRoutes.signIn);
    }
  }

  @override
  void onClose() {
    _timer?.cancel();
    super.onClose();
  }
}