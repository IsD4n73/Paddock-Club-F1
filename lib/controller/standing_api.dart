import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:paddock_club/common/urls.dart';

import '../model/standing_model.dart';

Future<List<DriverStandModel>> getDriverStanding() async {
  var response = await http.get(
      Uri.parse('$calendarApi${DateTime.now().year}/driverStandings.json'));
  List<DriverStandModel> standings = [];

  var responseJson = jsonDecode(response.body);

  try {
    responseJson = responseJson["MRData"]["StandingsTable"]["StandingsLists"][0]
        ["DriverStandings"];
  } on RangeError {
    return standings;
  }

  for (var positon in responseJson) {
    DriverStandModel driver;

    driver = DriverStandModel(
      position: positon["position"],
      driverCode: positon["Driver"]["code"],
      constructor: positon["Constructors"][0]["name"],
      points: positon["points"],
      wins: positon["wins"],
    );

    standings.add(driver);
  }
  return standings;
}

Future<List<TeamStandModel>> getTeamStanding() async {
  var response = await http.get(Uri.parse(
      '$calendarApi${DateTime.now().year}/constructorStandings.json'));
  List<TeamStandModel> standings = [];

  var responseJson = jsonDecode(response.body);

  try {
    responseJson = responseJson["MRData"]["StandingsTable"]["StandingsLists"][0]
        ["ConstructorStandings"];
  } on RangeError {
    return standings;
  }

  for (var positon in responseJson) {
    TeamStandModel team;

    team = TeamStandModel(
      name: positon["Constructor"]["name"],
      points: positon["points"],
      position: positon["position"],
      wins: positon["wins"],
    );

    standings.add(team);
  }
  return standings;
}
