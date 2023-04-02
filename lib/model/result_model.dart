class RaceRsultModel {
  String driverId;
  String position;
  String points;
  String driverCode;
  String constructorName;
  String time;
  bool isFastest;

  RaceRsultModel({
    required this.driverId,
    required this.position,
    required this.points,
    required this.driverCode,
    required this.time,
    required this.constructorName,
    required this.isFastest,
  });
}


class QualyRsultModel {
  String position;
  
  String driverCode;
  String constructorName;
  String q1;
  String q2;
  String q3;

  QualyRsultModel({
    required this.position,
    required this.q1,
    required this.driverCode,
    required this.q2,
    required this.constructorName,
    required this.q3,
  });
}
