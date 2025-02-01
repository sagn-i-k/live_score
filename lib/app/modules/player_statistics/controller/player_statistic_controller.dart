import 'package:get/get.dart';
import 'package:fl_chart/fl_chart.dart';

class PlayerStatisticsController extends GetxController {

  var graphData = <FlSpot>[].obs;
  var playerName = ''.obs;

  var avgPoint = ''.obs;
  var assist = ''.obs;
  var appear = ''.obs;
  var minute = ''.obs;
  var penalty = ''.obs;


  @override
  void onInit() {
    super.onInit();


    var arguments = Get.arguments as Map<String, dynamic>? ?? {};
    var playerData = arguments["playerData"] as Map<String, dynamic>? ?? {};

    playerName.value = playerData['player'] ?? "Unknown";

    avgPoint.value = playerData['averagePoint'] ?? "Unknown";
    assist.value = playerData['assists'] ?? "Unknown";
    appear.value = playerData['appearance'] ?? "Unknown";
    minute.value = playerData['minutes'] ?? "Unknown";
    penalty.value = playerData['penalties'] ?? "Unknown";

    setGraphData(playerData);
  }

  void setGraphData(Map<String, dynamic> player) {
    List<dynamic> rawPoints = player['graphPoints'] ?? [];

    // Convert raw data to FlSpot list
    graphData.value = rawPoints.map((point) {
      return FlSpot(
        (point['x'] as num).toDouble(),
        (point['y'] as num).toDouble(),
      );
    }).toList();
  }


}