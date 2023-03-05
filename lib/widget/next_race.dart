import "package:flutter/material.dart";
import "package:paddock_club/controller/utils.dart";

import "../common/colors.dart";
import "../model/calendar_model.dart";

// ignore: must_be_immutable
class NextRaceCard extends StatelessWidget {
  RaceScheduleModel nextRace;
  
  NextRaceCard(this.nextRace, {super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      color: AppColor.secondary,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    "PROSSIMA GARA",
                    style: TextStyle(
                      fontFamily: "F1Bold",
                      color: Colors.white,
                      fontSize: 25,
                    ),
                  ),
                  Text(
                    nextRace.raceName,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontFamily: "F1Bold",
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                  Text(
                    "DATA: ${nextRace.date} - ${nextRace.time}",
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontFamily: "F1",
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            Image.asset(
              getFlagFromName(nextRace.country),
              width: 60,
              height: 60,
              errorBuilder: (context, error, stackTrace) => const Icon(
                Icons.flag,
                color: Colors.white,
              ),
              package: 'country_icons',
            ),
          ],
        ),
      ),
    );
  }
}
