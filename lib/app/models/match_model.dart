import 'dart:convert';

List<MatchModel> matchModelFromJson(String str) =>
    List<MatchModel>.from(json.decode(str)["data"].map((x) => MatchModel.fromJson(x)));

class MatchModel {
  int id;
  int localteamId;
  int visitorteamId;
  int localteamScore;
  int visitorteamScore;
  String status;
  String dateTime;
  String localteamFormation;
  String visitorteamFormation;
  String weatherIcon;
  String weatherType;

  MatchModel({
    required this.id,
    required this.localteamId,
    required this.visitorteamId,
    required this.localteamScore,
    required this.visitorteamScore,
    required this.status,
    required this.dateTime,
    required this.localteamFormation,
    required this.visitorteamFormation,
    required this.weatherIcon,
    required this.weatherType,
  });

  factory MatchModel.fromJson(Map<String, dynamic> json) => MatchModel(
    id: json["id"],
    localteamId: json["localteam_id"],
    visitorteamId: json["visitorteam_id"],
    localteamScore: json["scores"]["localteam_score"],
    visitorteamScore: json["scores"]["visitorteam_score"],
    status: json["time"]["status"],
    dateTime: json["time"]["starting_at"]["date_time"],
    localteamFormation: json["formations"]["localteam_formation"] ?? "N/A",
    visitorteamFormation: json["formations"]["visitorteam_formation"] ?? "N/A",
    weatherIcon: json["weather_report"]?["icon"] ?? "",
    weatherType: json["weather_report"]?["type"] ?? "N/A",
  );
}
