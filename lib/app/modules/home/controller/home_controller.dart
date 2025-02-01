import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../../../models/match_model.dart';


class HomeController extends GetxController {

  var matchList = <MatchModel>[].obs;
  var isLoading = true.obs;

  var liveMatches = <Map<String, dynamic>>[].obs;
  var fixtures = <Map<String, String>>[].obs;
  var news = <Map<String, String>>[].obs;


  @override
  void onInit() {
    //fetchMatches();
    loadLiveMatches();
    loadDemoData();
    loadNewsData();
    super.onInit();
  }

  void loadLiveMatches() {
    liveMatches.value = [
      {
        "team1": "Team A",
        "team1Logo": "assets/icons/team1_Licon.png",
        "team2": "Team B",
        "team2Logo": "assets/icons/team2_Licon.png",
        "score": "2 - 1",
        "time": "85'",
        "scorers": {
          "team1Scorers": ["Player 1 (45')", "Player 2 (67')"],
          "team2Scorers": ["Player 5 (78')"]
        },
        "stats": {
          "team1": {
            "shots": 10,
            "shotsOnTarget": 5,
            "possession": "55%",
            "passes": 400,
            "passAccuracy": "85%",
            "fouls": 8,
            "yellowCards": 1,
            "redCards": 0,
            "offsides": 2,
            "corners": 4
          },
          "team2": {
            "shots": 7,
            "shotsOnTarget": 3,
            "possession": "45%",
            "passes": 350,
            "passAccuracy": "80%",
            "fouls": 10,
            "yellowCards": 2,
            "redCards": 0,
            "offsides": 1,
            "corners": 3
          }
        }
      },
      {
        "team1": "Team C",
        "team1Logo": "assets/icons/team1_Licon.png",
        "team2": "Team D",
        "team2Logo": "assets/icons/team2_Licon.png",
        "score": "1 - 1",
        "time": "75'",
        "scorers": {
          "team1Scorers": ["Player 8 (30')"],
          "team2Scorers": ["Player 12 (60')"]
        },
        "stats": {
          "team1": {
            "shots": 8,
            "shotsOnTarget": 4,
            "possession": "50%",
            "passes": 380,
            "passAccuracy": "82%",
            "fouls": 6,
            "yellowCards": 0,
            "redCards": 0,
            "offsides": 1,
            "corners": 2
          },
          "team2": {
            "shots": 9,
            "shotsOnTarget": 4,
            "possession": "50%",
            "passes": 370,
            "passAccuracy": "81%",
            "fouls": 7,
            "yellowCards": 1,
            "redCards": 0,
            "offsides": 2,
            "corners": 3
          }
        }
      },
      {
        "team1": "Team C",
        "team1Logo": "assets/icons/team1_Licon.png",
        "team2": "Team D",
        "team2Logo": "assets/icons/team2_Licon.png",
        "score": "1 - 1",
        "time": "75'",
        "scorers": {
          "team1Scorers": ["Player 8 (30')"],
          "team2Scorers": ["Player 12 (60')"]
        },
        "stats": {
          "team1": {
            "shots": 8,
            "shotsOnTarget": 4,
            "possession": "50%",
            "passes": 380,
            "passAccuracy": "82%",
            "fouls": 6,
            "yellowCards": 0,
            "redCards": 0,
            "offsides": 1,
            "corners": 2
          },
          "team2": {
            "shots": 9,
            "shotsOnTarget": 4,
            "possession": "50%",
            "passes": 370,
            "passAccuracy": "81%",
            "fouls": 7,
            "yellowCards": 1,
            "redCards": 0,
            "offsides": 2,
            "corners": 3
          }
        }
      }
    ];
  }




  void loadDemoData() {
    fixtures.value = [
      {"team1": "Team A","team1Logo":"assets/icons/team_1_icon.png", "team2": "Team B","team2Logo":"assets/icons/team_2_icon.png", "date": "2025-02-01", "time": "18:00"},
      {"team1": "Team C","team1Logo":"assets/icons/team_1_icon.png" ,"team2": "Team D","team2Logo":"assets/icons/team_2_icon.png", "date": "2025-02-02", "time": "20:00"},
      {"team1": "Team E","team1Logo":"assets/icons/team_1_icon.png", "team2": "Team F","team2Logo":"assets/icons/team_2_icon.png", "date": "2025-02-03", "time": "19:30"},
      {"team1": "Team A","team1Logo":"assets/icons/team_1_icon.png", "team2": "Team B","team2Logo":"assets/icons/team_2_icon.png", "date": "2025-02-01", "time": "18:00"},
      {"team1": "Team C","team1Logo":"assets/icons/team_1_icon.png" ,"team2": "Team D","team2Logo":"assets/icons/team_2_icon.png", "date": "2025-02-02", "time": "20:00"},
      {"team1": "Team E","team1Logo":"assets/icons/team_1_icon.png", "team2": "Team F","team2Logo":"assets/icons/team_2_icon.png", "date": "2025-02-03", "time": "19:30"},
    ];
  }

  void loadNewsData(){
    news.value=[
      {"newsImg":"assets/images/news_img.png","newsTitle":"Champions League 2022-23 \ndraw: group stage analysis \nand predictions"},
      {"newsImg":"assets/images/news_img.png","newsTitle":"Champions League 2022-23 \ndraw: group stage analysis \nand predictions"},
      {"newsImg":"assets/images/news_img.png","newsTitle":"Champions League 2022-23 \ndraw: group stage analysis \nand predictions"},
    ];
  }
}




// If Api was available
// Future<void> fetchMatches() async {
//   try {
//     isLoading(true);
//     final response = await http.get(Uri.parse("https://soccer.sportmonks.com/api/v2.0/fixtures/between/:2020-08-02/:2020-08-10?api_token=$apiKey",
//     ),headers: {
//       "Accept": "application/json",
//     },);
//     if (response.statusCode == 200) {
//       var data = json.decode(response.body);
//       matchList.value = List<MatchModel>.from(data["data"].map((x) => MatchModel.fromJson(x)));
//     } else {
//       Get.snackbar("Error", "Failed to fetch data");
//     }
//   } catch (e) {
//     Get.snackbar("Error", "Something went wrong");
//   } finally {
//     isLoading(false);
//   }
// }