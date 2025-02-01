import 'package:get/get.dart';

class MatchStatisticsController extends GetxController {
  var matchData = {}.obs;

  @override
  void onInit() {
    super.onInit();

    if (Get.arguments != null) {
      matchData.value = Get.arguments;
      print("Received match data in MatchStatistics: ${matchData.value}");
    } else {
      print("No match data received!");
    }
  }
}
