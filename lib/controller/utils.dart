String getFlagFromName(String country) {
  String locale = country.substring(0, 2).toLowerCase();

  if (locale == "un") locale = "us";
  if (locale == "sp") locale = "es";
  if (locale == "ja") locale = "jp";
  if (locale == "uk") locale = "gb-nir";

  return "icons/flags/png/$locale.png";
}
