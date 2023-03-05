import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:paddock_club/common/urls.dart';
import 'package:paddock_club/model/calendar_model.dart';

Future<List<RaceScheduleModel>> getRaceSchedule(int year) async {
  var response = await http.get(Uri.parse('$calendarApi$year.json'));
  List<RaceScheduleModel> races = [];

  var responseJson = jsonDecode(response.body);
  responseJson = responseJson["MRData"]["RaceTable"]["Races"];

  for (var race in responseJson) {
    races.add(
      RaceScheduleModel(
        raceName: race["raceName"],
        country: race["Circuit"]["Location"]["country"],
        date: race["date"],
        time: race["time"],
        round: race["round"],
        circuit: race["Circuit"]["circuitId"],
        haveSprint: race.containsKey("Sprint"),
      ),
    );
  }

  return races;
}

Future<RaceScheduleModel> getNextRace(int year) async {
  var response = await http.get(Uri.parse('$calendarApi$year.json'));
  RaceScheduleModel races = RaceScheduleModel(
    raceName: "Nessuna Gara",
    country: "it",
    date: "N/D",
    time: "",
    round: "",
    circuit: "",
  );

  var responseJson = jsonDecode(response.body);
  responseJson = responseJson["MRData"]["RaceTable"]["Races"];

  DateTime today = DateTime.now();

  for (var race in responseJson) {
    DateTime dateRace = DateTime.parse(race["date"]);
    if (today.compareTo(dateRace) < 0) {
      return RaceScheduleModel(
        raceName: race["raceName"],
        country: race["Circuit"]["Location"]["country"],
        date: race["date"],
        time: race["time"],
        round: race["round"],
        circuit: race["Circuit"]["circuitId"],
        haveSprint: race.containsKey("Sprint"),
      );
    }
  }
  return races;
}



