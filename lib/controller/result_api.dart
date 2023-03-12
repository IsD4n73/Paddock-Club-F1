// ignore_for_file: prefer_typing_uninitialized_variables

import 'dart:convert';

import 'package:http/http.dart' as http;

import '../common/urls.dart';
import '../model/result_model.dart';

Future<List<RaceRsultModel>> getRaceResult(String idRace) async {
  var response = await http.get(
      Uri.parse('$calendarApi${DateTime.now().year}/$idRace/results.json'));

  var fastest = await http.get(Uri.parse(
      '$calendarApi${DateTime.now().year}/$idRace/fastest/1/results.json'));

  List<RaceRsultModel> results = [];

  var responseJson;
  var fastestJson;
  try {
    fastestJson = jsonDecode(fastest.body);
    fastestJson = fastestJson["MRData"]["RaceTable"]["Races"][0]["Results"][0]
        ["Driver"]["code"];
    responseJson = jsonDecode(response.body);
    responseJson = responseJson["MRData"]["RaceTable"]["Races"][0]["Results"];
  } on RangeError {
    return results;
  }

  for (var race in responseJson) {
    RaceRsultModel driver;

    driver = RaceRsultModel(
      position: race["position"],
      points: race["points"],
      driverCode: race["Driver"]["code"],
      time: race.containsKey("Time") ? race["Time"]["time"] : race["status"],
      constructorName: race["Constructor"]["name"],
      isFastest: race["Driver"]["code"] == fastestJson,
    );

    results.add(driver);
  }

  return results;
}
