import "package:flutter/material.dart";
import "package:paddock_club/common/colors.dart";

String getFlagFromName(String country) {
  String locale = country.substring(0, 2).toLowerCase();

  if (locale == "un") locale = "us";
  if (locale == "sp") locale = "es";
  if (locale == "ja") locale = "jp";
  if (locale == "uk") locale = "gb-nir";
  if (locale == "ch") locale = "cn";
  if (locale == "mo") locale = "mc";
  if (locale == "ne") locale = "nl";
  if (locale == "ba") locale = "bh";
  if (locale == "si") locale = "sg";
  if (locale == "me") locale = "mx";
  if (locale == "ua") locale = "ae";

  return "icons/flags/png250px/$locale.png";
}

Color? getTeamColor(String team) {
  switch (team) {
    case "Red Bull":
      return TeamColor.redbull;
    case "Aston Martin":
      return TeamColor.astonMartin;
    case "McLaren":
      return TeamColor.mclaren;
    case "Ferrari":
      return TeamColor.ferrari;
    case "Mercedes":
      return TeamColor.mercedes;
    case "Sauber":
      return TeamColor.sauber;
    case "Alpine F1 Team":
      return TeamColor.alpine;
    case "Williams":
      return TeamColor.williams;
    case "RB F1 Team":
      return TeamColor.rbVisaCash;
    case "Haas F1 Team":
      return TeamColor.haas;

    default:
      return Colors.amber;
  }
}
