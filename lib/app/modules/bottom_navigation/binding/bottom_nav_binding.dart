import 'package:get/get.dart';
import '../../auth/controller/auth_controller.dart';
import '../../gallery/controller/gallery_controller.dart';
import '../../home/controller/home_controller.dart';
import '../../standings/controller/standings_controller.dart';
import '../controller/bottom_nav_controller.dart';


class BottomNavBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BottomNavController>(() => BottomNavController());
    Get.lazyPut<HomeController>(() => HomeController(),fenix: true);
    Get.lazyPut<StandingsController>(() => StandingsController(),fenix: true);
    Get.lazyPut<GalleryController>(() => GalleryController(),fenix: true);
    Get.lazyPut<AuthController>(() => AuthController(),fenix: true);
  }
}