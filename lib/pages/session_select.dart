import "package:flutter/material.dart";
import "package:paddock_club/widget/session_tile.dart";

import "../common/colors.dart";
import "../controller/utils.dart";
import "../model/calendar_model.dart";

// ignore: must_be_immutable
class SessionSelectPage extends StatefulWidget {
  RaceScheduleModel race;
  SessionSelectPage(this.race, {super.key});

  @override
  State<SessionSelectPage> createState() => _SessionSelectPageState();
}

class _SessionSelectPageState extends State<SessionSelectPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.background,
      appBar: AppBar(
        backgroundColor: AppColor.background,
        title: const Text(
          "Sessioni",
          style: TextStyle(fontFamily: "F1Bold"),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(5),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: Text(
                      widget.race.raceName,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontFamily: "F1Bold",
                        color: Colors.white,
                        fontSize: 25,
                      ),
                    ),
                  ),
                  Image.asset(
                    getFlagFromName(widget.race.country),
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
            ListView(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              children: [
                SessionListTile(
                  title: "Prove Libere 1",
                  subTitle: "subTitle",
                  type: 0,
                ),
                SessionListTile(
                  title: "Prove Libere 1",
                  subTitle: "subTitle",
                  type: 0,
                ),
                SessionListTile(
                  title: "Prove Libere 1",
                  subTitle: "subTitle",
                  type: 0,
                ),
                SessionListTile(
                  title: "Qualifiche",
                  subTitle: "subTitle",
                  type: 1,
                ),
                widget.race.haveSprint ?? false
                    ? SessionListTile(
                        title: "Sprint",
                        subTitle: "subTitle",
                        type: 2,
                      )
                    : const SizedBox.shrink(),
                SessionListTile(
                  title: "Gara",
                  subTitle: "subTitle",
                  type: 3,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
