import 'package:paddock_club/model/race_time_model.dart';

class RaceScheduleModel {
  String raceName;
  String date;
  String time;
  String country;
  String round;
  String circuit;
  bool? haveSprint;
  RaceTimeModel? sessionTimes;

  RaceScheduleModel({
    required this.raceName,
    required this.country,
    required this.date,
    required this.time,
    required this.round,
    required this.circuit,
    this.haveSprint,
    this.sessionTimes,
  });
}
