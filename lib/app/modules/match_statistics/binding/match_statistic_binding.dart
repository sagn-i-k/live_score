import 'package:football_app/app/modules/match_statistics/controller/match_statistic_controller.dart';
import 'package:get/get.dart';


class MatchStatisticsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MatchStatisticsController>(() => MatchStatisticsController());
  }
}