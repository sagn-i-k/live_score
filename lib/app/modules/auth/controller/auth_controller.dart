import 'package:football_app/app/utils/string_manager.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthController extends GetxController {
  var isLoggedIn = false.obs;
  var isChecked = false.obs;

  void toggleCheck() {
    isChecked.value = !isChecked.value;
  }


  String? validateEmail(String? email) {
    if (email == null || email.isEmpty) {
      return 'Please enter your email';
    } else if (!GetUtils.isEmail(email)) {
      return 'Please enter a valid email address';
    }
    return null;
  }

  // Check password validation
  String? validatePassword(String? password) {
    if (password == null || password.isEmpty) {
      return 'Please enter your password';
    } else if (password.length < 10) {
      return 'Password must be at least 10 characters long';
    }
    return null;
  }

  /// Check if the user is logged in
  void checkLoginStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    isLoggedIn.value = prefs.getBool('isLoggedIn') ?? false;
  }

  /// Login function with proper validation
  Future<void> login(String email, String password) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? storedEmail = prefs.getString('email');
    String? storedPassword = prefs.getString('password');


    if (email == storedEmail && password == storedPassword) {
      await prefs.setBool('isLoggedIn', true);
      isLoggedIn.value = true;
      Get.offAllNamed('/bottomNavBar');
    } else {
      Get.snackbar('Error', StringManager.invalidInputText);
    }
  }

  /// Sign-up function to store user credentials
  Future<void> signUp(String email, String password) async {
    if (email.isNotEmpty && password.length >= 6) {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('email', email);
      await prefs.setString('password', password);
      Get.snackbar('Success', StringManager.accountCreationText);
      Get.toNamed('/bottomNavBar');
    } else {
      Get.snackbar('Error', StringManager.invalidInputText);
    }
  }

  /// Logout function
  Future<void> logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear();
    isLoggedIn.value = false;
    Get.offAllNamed('/sign-in'); // Navigate to LoginPage
  }
}