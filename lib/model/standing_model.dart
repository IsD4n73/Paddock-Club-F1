class DriverStandModel {
  String position;
  String points;
  String driverCode;
  String wins;
  String constructor;

  DriverStandModel({
    required this.position,
    required this.driverCode,
    required this.constructor,
    required this.points,
    required this.wins,
  });
}

class TeamStandModel {
  String position;
  String points;
  String wins;
  String name;

  TeamStandModel({
    required this.name,
    required this.points,
    required this.position,
    required this.wins,
  });
}
