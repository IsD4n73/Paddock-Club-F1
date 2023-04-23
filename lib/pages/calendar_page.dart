import "package:flutter/material.dart";
import "package:paddock_club/common/bottom_bar.dart";
import "package:paddock_club/common/colors.dart";
import "package:paddock_club/controller/calendar_api.dart";
import "package:paddock_club/model/calendar_model.dart";
import "package:paddock_club/widget/calendar_list.dart";
import "package:paddock_club/widget/next_race.dart";

import "../widget/placeholders/card.dart";
import "../widget/placeholders/list_tiles.dart";

class CalendarPage extends StatefulWidget {
  const CalendarPage({super.key});

  @override
  State<CalendarPage> createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  late Future<List<RaceScheduleModel>> races;
  late DateTime currentDate;
  late Future<RaceScheduleModel> nextRace;

  @override
  void initState() {
    super.initState();

    currentDate = DateTime.now();

    setState(() {
      nextRace = getNextRace(currentDate.year);
    });

    races = getRaceSchedule(currentDate.year);
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
            FutureBuilder(
              future: nextRace,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return NextRaceCard(snapshot.data!);
                }
                return const CardShimmer();
              },
            ),
            FutureBuilder(
              future: races,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      if (snapshot.data!.isEmpty) {
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

                        String dateToCheck =
                            snapshot.data![index].date.replaceAll("0", "");

                        if (dateToday == dateToCheck) {
                          isToday = true;
                        }

                        return CalendarListTile(snapshot.data![index], isToday);
                      }
                    },
                  );
                }
                return const ListTilesShimmer();
              },
            ),
          ],
        ),
      ),
    );
  }
}
