import 'package:get/get.dart';

class StandingsController extends GetxController {
  var standings = <Map<String, dynamic>>[].obs;
  var showAll = false.obs;

  var topScorers = <Map<String, dynamic>>[].obs;
  var showAllScorers = false.obs;

  @override
  void onInit() {
    super.onInit();
    fetchStandings();
    fetchTopScorers();
  }

  void fetchStandings() {
    standings.value = [
      {"rem": "G", "team": "Team A", "win": 8, "lose": 1, "draw": 1, "points": 25},
      {"rem": "G", "team": "Team B", "win": 7, "lose": 2, "draw": 1, "points": 22},
      {"rem": "G", "team": "Team C", "win": 6, "lose": 3, "draw": 1, "points": 19},
      {"rem": "B", "team": "Team D", "win": 5, "lose": 4, "draw": 1, "points": 16},
      {"rem": "B", "team": "Team E", "win": 5, "lose": 4, "draw": 1, "points": 16},
      {"rem": "B", "team": "Team F", "win": 4, "lose": 5, "draw": 1, "points": 13},
      {"rem": "B", "team": "Team G", "win": 3, "lose": 6, "draw": 1, "points": 10},
      {"rem": "B", "team": "Team H", "win": 3, "lose": 6, "draw": 1, "points": 10},
      {"rem": "B", "team": "Team I", "win": 2, "lose": 7, "draw": 1, "points": 7},
      {"rem": "B", "team": "Team J", "win": 1, "lose": 8, "draw": 1, "points": 4},
    ];
  }

  void fetchTopScorers() {
    topScorers.value = [
      {
        "player": "Player A",
        "goals": "10",
        "averagePoint":"84",
        "assists":"121",
        "appearance":"56",
        "minutes":"3400",
        "penalties":"23",
        "graphPoints": [
          {"x": 1, "y": 10}, {"x": 2, "y": 14}, {"x": 3, "y": 9}, {"x": 4, "y": 15},
          {"x": 5, "y": 8}, {"x": 6, "y": 13}, {"x": 7, "y": 10}, {"x": 8, "y": 14},
          {"x": 9, "y": 9}, {"x": 10, "y": 12}
        ]
      },
      {
        "player": "Player B",
        "goals": "10",
        "averagePoint":"84",
        "assists":"121",
        "appearance":"56",
        "minutes":"3400",
        "penalties":"23",
        "graphPoints": [
          {"x": 1, "y": 7}, {"x": 2, "y": 12}, {"x": 3, "y": 6}, {"x": 4, "y": 11},
          {"x": 5, "y": 5}, {"x": 6, "y": 10}, {"x": 7, "y": 8}, {"x": 8, "y": 12},
          {"x": 9, "y": 7}, {"x": 10, "y": 11}
        ]
      },
      {
        "player": "Player C",
        "goals": "10",
        "averagePoint":"84",
        "assists":"121",
        "appearance":"56",
        "minutes":"3400",
        "penalties":"23",
        "graphPoints": [
          {"x": 1, "y": 6}, {"x": 2, "y": 11}, {"x": 3, "y": 5}, {"x": 4, "y": 10},
          {"x": 5, "y": 4}, {"x": 6, "y": 9}, {"x": 7, "y": 7}, {"x": 8, "y": 11},
          {"x": 9, "y": 6}, {"x": 10, "y": 10}
        ]
      },
      {
        "player": "Player D",
        "goals": 8,
        "graphPoints": [
          {"x": 1, "y": 8}, {"x": 2, "y": 13}, {"x": 3, "y": 7}, {"x": 4, "y": 12},
          {"x": 5, "y": 6}, {"x": 6, "y": 11}, {"x": 7, "y": 9}, {"x": 8, "y": 13},
          {"x": 9, "y": 8}, {"x": 10, "y": 12}
        ]
      },
      {
        "player": "Player C",
        "goals": "10",
        "averagePoint":"84",
        "assists":"121",
        "appearance":"56",
        "minutes":"3400",
        "penalties":"23",
        "graphPoints": [
          {"x": 1, "y": 6}, {"x": 2, "y": 11}, {"x": 3, "y": 5}, {"x": 4, "y": 10},
          {"x": 5, "y": 4}, {"x": 6, "y": 9}, {"x": 7, "y": 7}, {"x": 8, "y": 11},
          {"x": 9, "y": 6}, {"x": 10, "y": 10}
        ]
      },
      {
        "player": "Player C",
        "goals": "10",
        "averagePoint":"84",
        "assists":"121",
        "appearance":"56",
        "minutes":"3400",
        "penalties":"23",
        "graphPoints": [
          {"x": 1, "y": 6}, {"x": 2, "y": 11}, {"x": 3, "y": 5}, {"x": 4, "y": 10},
          {"x": 5, "y": 4}, {"x": 6, "y": 9}, {"x": 7, "y": 7}, {"x": 8, "y": 11},
          {"x": 9, "y": 6}, {"x": 10, "y": 10}
        ]
      },
      {
        "player": "Player C",
        "goals": "10",
        "averagePoint":"84",
        "assists":"121",
        "appearance":"56",
        "minutes":"3400",
        "penalties":"23",
        "graphPoints": [
          {"x": 1, "y": 6}, {"x": 2, "y": 11}, {"x": 3, "y": 5}, {"x": 4, "y": 10},
          {"x": 5, "y": 4}, {"x": 6, "y": 9}, {"x": 7, "y": 7}, {"x": 8, "y": 11},
          {"x": 9, "y": 6}, {"x": 10, "y": 10}
        ]
      },
      {
        "player": "Player C",
        "goals": "10",
        "averagePoint":"84",
        "assists":"121",
        "appearance":"56",
        "minutes":"3400",
        "penalties":"23",
        "graphPoints": [
          {"x": 1, "y": 6}, {"x": 2, "y": 11}, {"x": 3, "y": 5}, {"x": 4, "y": 10},
          {"x": 5, "y": 4}, {"x": 6, "y": 9}, {"x": 7, "y": 7}, {"x": 8, "y": 11},
          {"x": 9, "y": 6}, {"x": 10, "y": 10}
        ]
      },
      {
        "player": "Player C",
        "goals": "10",
        "averagePoint":"84",
        "assists":"121",
        "appearance":"56",
        "minutes":"3400",
        "penalties":"23",
        "graphPoints": [
          {"x": 1, "y": 6}, {"x": 2, "y": 11}, {"x": 3, "y": 5}, {"x": 4, "y": 10},
          {"x": 5, "y": 4}, {"x": 6, "y": 9}, {"x": 7, "y": 7}, {"x": 8, "y": 11},
          {"x": 9, "y": 6}, {"x": 10, "y": 10}
        ]
      },
      {
        "player": "Player C",
        "goals": "10",
        "averagePoint":"84",
        "assists":"121",
        "appearance":"56",
        "minutes":"3400",
        "penalties":"23",
        "graphPoints": [
          {"x": 1, "y": 6}, {"x": 2, "y": 11}, {"x": 3, "y": 5}, {"x": 4, "y": 10},
          {"x": 5, "y": 4}, {"x": 6, "y": 9}, {"x": 7, "y": 7}, {"x": 8, "y": 11},
          {"x": 9, "y": 6}, {"x": 10, "y": 10}
        ]
      },
    ];
  }

  void toggleShowAll() {
    showAll.value = !showAll.value;
  }

  void toggleShowAllScorers() {
    showAllScorers.value = !showAllScorers.value;
  }
}
