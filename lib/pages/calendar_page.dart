import "package:flutter/material.dart";
import "package:paddock_club/common/bottom_bar.dart";
import "package:paddock_club/common/colors.dart";
import "package:paddock_club/controller/calendar_api.dart";
import "package:paddock_club/model/calendar_model.dart";
import "package:paddock_club/widget/calendar_list.dart";
import "package:paddock_club/widget/next_race.dart";
import "package:salomon_bottom_bar/salomon_bottom_bar.dart";

class CalendarPage extends StatefulWidget {
  const CalendarPage({super.key});

  @override
  State<CalendarPage> createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  List<RaceScheduleModel> races = [];
  late DateTime currentDate;
  late RaceScheduleModel nextRace = RaceScheduleModel(
    raceName: "Nessuna Gara",
    country: "it",
    date: "N/D",
    time: "",
    round: "",
    circuit: "",
  );

  @override
  void initState() {
    super.initState();

    currentDate = DateTime.now();

    getNextRace(currentDate.year).then((value) {
      setState(() {
        nextRace = value;
      });
    });

    getRaceSchedule(currentDate.year).then((value) {
      setState(() {
        races = value;
      });
    });

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.background,
      appBar: AppBar(
        backgroundColor: AppColor.background,
        title: const Text(
          "Calendario",
          style: TextStyle(fontFamily: "F1Bold"),
        ),
        centerTitle: true,
      ),
      bottomNavigationBar: getBottomBar(0, context),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            NextRaceCard(nextRace),
            ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: races.length,
              itemBuilder: (context, index) {
                if (races.isEmpty) {
                  return const Center(
                    child: Text(
                      "Nessuna Gara trovata :(",
                      style: TextStyle(
                        fontFamily: "F1Bold",
                        color: Colors.white,
                      ),
                    ),
                  );
                } else {
                  bool isToday = false;
                  String dateToday =
                      "${currentDate.year}-${currentDate.month}-${currentDate.day}";
                  dateToday = dateToday.replaceAll("0", "");

                  String dateToCheck = races[index].date.replaceAll("0", "");

                  if (dateToday == dateToCheck) {
                    isToday = true;
                  }

                  return CalendarListTile(races[index], isToday);
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
