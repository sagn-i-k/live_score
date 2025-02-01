import 'package:get/get.dart';
import '../controller/player_statistic_controller.dart';


class PlayerStatisticsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PlayerStatisticsController>(() => PlayerStatisticsController());
  }
}