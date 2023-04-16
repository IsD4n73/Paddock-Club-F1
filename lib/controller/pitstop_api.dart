import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:paddock_club/common/urls.dart';

import '../model/pit_model.dart';

Future<List<PitModel>> getPitstopDriver(String driverId, String round) async {
  var response = await http.get(Uri.parse(
      '$calendarApi${DateTime.now().year}/$round/drivers/$driverId/pitstops.json'));

  List<PitModel> result = [];

  var responseJson = jsonDecode(response.body);

  responseJson = responseJson["MRData"]["RaceTable"]["Races"][0]["PitStops"];

  for (var pit in responseJson) {
    PitModel model = PitModel(
      lap: pit["lap"],
      stop: pit["stop"],
      duration: pit["duration"],
    );

    result.add(model);
  }

  return result;
}
