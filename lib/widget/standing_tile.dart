// ignore_for_file: must_be_immutable

import "package:flutter/material.dart";
import "package:paddock_club/common/colors.dart";
import "package:paddock_club/controller/pitstop_api.dart";
import "package:paddock_club/model/result_model.dart";
import "package:paddock_club/widget/pitstop_sheet.dart";

import "../controller/utils.dart";

class StandingTileShort extends StatelessWidget {
  RaceRsultModel driver;
  String idRace;
  StandingTileShort(this.driver, [this.idRace = "0"]);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColor.secondary,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: InkWell(
          onTap: () async {
            await getPitstopDriver(driver.driverId, idRace).then((value) => showPitstop(context, value));
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Text(
                    driver.position,
                    style: const TextStyle(
                      fontFamily: "F1",
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Container(
                    width: 2,
                    height: 15,
                    color: Colors.white,
                  ),
                  const SizedBox(width: 10),
                  Container(
                    width: 10,
                    height: 15,
                    color: getTeamColor(driver.constructorName),
                  ),
                  const SizedBox(width: 10),
                  Text(
                    driver.driverCode,
                    style: const TextStyle(
                      fontFamily: "F1Bold",
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    driver.time,
                    style: TextStyle(
                      fontFamily: "F1",
                      color: driver.isFastest ? Colors.purple : Colors.white,
                    ),
                  ),
                  const SizedBox(width: 15),
                  Text(
                    "+${driver.points}",
                    style: const TextStyle(
                      fontFamily: "F1Bold",
                      color: Colors.white,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
