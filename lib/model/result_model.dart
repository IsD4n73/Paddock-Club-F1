class RaceRsultModel {
  String position;
  String points;

  String driverCode;

  String constructorName;

  String time;
  bool isFastest;

  RaceRsultModel({
    required this.position,
    required this.points,
    required this.driverCode,
    required this.time,
    required this.constructorName,
    required this.isFastest,
  });
}
