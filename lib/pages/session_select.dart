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
  late DateTime today;
  late String todayStr;

  @override
  void initState() {
    super.initState();

    setState(() {
      today = DateTime.now();
      todayStr =
          "${today.year}-${today.month}-${today.day}".replaceAll("0", "");
    });
  }

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
                  subTitle: widget.race.sessionTimes!.practice1,
                  type: 0,
                  isToday: todayStr ==
                      widget.race.sessionTimes!.practice1
                          .substring(0, 10)
                          .replaceAll("0", ""),
                ),
                SessionListTile(
                  title: "Prove Libere 2",
                  subTitle: widget.race.sessionTimes!.practice2,
                  type: 0,
                  isToday: todayStr ==
                      widget.race.sessionTimes!.practice2
                          .substring(0, 10)
                          .replaceAll("0", ""),
                ),
                SessionListTile(
                  title: "Prove Libere 3",
                  subTitle: widget.race.sessionTimes!.practice3,
                  type: 0,
                  isToday: todayStr ==
                      widget.race.sessionTimes!.practice3
                          .substring(0, 10)
                          .replaceAll("0", ""),
                ),
                SessionListTile(
                  title: "Qualifiche",
                  subTitle: widget.race.sessionTimes!.qualify,
                  type: 1,
                  isToday: todayStr ==
                      widget.race.sessionTimes!.qualify
                          .substring(0, 10)
                          .replaceAll("0", ""),
                ),
                widget.race.haveSprint ?? false
                    ? SessionListTile(
                        title: "Sprint",
                        subTitle: widget.race.sessionTimes!.sprint ?? "N/D",
                        type: 2,
                        isToday: todayStr ==
                            widget.race.sessionTimes!.sprint!
                                .substring(0, 10)
                                .replaceAll("0", ""),
                      )
                    : const SizedBox.shrink(),
                SessionListTile(
                  title: "Gara",
                  subTitle: "${widget.race.date} - ${widget.race.time}",
                  type: 3,
                  isToday: todayStr == widget.race.date.replaceAll("0", ""),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
