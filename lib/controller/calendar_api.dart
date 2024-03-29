import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:paddock_club/common/urls.dart';
import 'package:paddock_club/model/calendar_model.dart';
import 'package:paddock_club/model/race_time_model.dart';

Future<List<RaceScheduleModel>> getRaceSchedule(int year) async {
  var response = await http.get(Uri.parse('$calendarApi$year.json'));
  List<RaceScheduleModel> races = [];

  var responseJson = jsonDecode(response.body);
  responseJson = responseJson["MRData"]["RaceTable"]["Races"];

  for (var race in responseJson) {
    RaceTimeModel? sessionTime;


    sessionTime = RaceTimeModel(
      practice1:
          '${race["FirstPractice"]["date"]} - ${race["FirstPractice"]["time"].replaceAll(":00Z", "")}',
      practice2:
          '${race["SecondPractice"]["date"]} - ${race["SecondPractice"]["time"].replaceAll(":00Z", "")}',
      practice3:
          race.containsKey("ThirdPractice") ? '${race["ThirdPractice"]["date"]} - ${race["ThirdPractice"]["time"].replaceAll(":00Z", "")}' : "N/D",
      qualify: '${race["Qualifying"]["date"]} - ${race["Qualifying"]["time"].replaceAll(":00Z", "")}',
      sprint: race.containsKey("Sprint")
          ? '${race["Sprint"]["date"]} - ${race["Sprint"]["time"].replaceAll(":00Z", "")}'
          : null,
    );

    races.add(
      RaceScheduleModel(
        raceName: race["raceName"],
        country: race["Circuit"]["Location"]["country"],
        date: race["date"],
        time: race["time"].replaceAll(":00Z", ""),
        round: race["round"],
        circuit: race["Circuit"]["circuitId"],
        haveSprint: race.containsKey("Sprint"),
        sessionTimes: sessionTime,
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
        time: race["time"].replaceAll(":00Z", ""),
        round: race["round"],
        circuit: race["Circuit"]["circuitId"],
        haveSprint: race.containsKey("Sprint"),
      );
    }
  }
  return races;
}
