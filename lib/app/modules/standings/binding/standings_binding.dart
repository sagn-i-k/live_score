import 'package:get/get.dart';
import '../controller/standings_controller.dart';

class StandingsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<StandingsController>(() => StandingsController());
  }
}