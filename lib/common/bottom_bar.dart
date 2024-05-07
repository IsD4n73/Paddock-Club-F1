import "package:flutter/material.dart";
import "package:paddock_club/pages/calendar_page.dart";
import "package:paddock_club/pages/driver_stand.dart";
import "package:paddock_club/pages/team_overview.dart";
import "package:paddock_club/pages/team_standing.dart";
import "package:salomon_bottom_bar/salomon_bottom_bar.dart";

import "colors.dart";

Widget? getBottomBar(int index, BuildContext context) {
  return SalomonBottomBar(
    currentIndex: index,
    unselectedItemColor: AppColor.detailsSecondary,
    onTap: (i) {
      switch (i) {
        case 0:
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const CalendarPage(),
            ),
          );
          break;
        case 1:
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const DriverStandingPage(),
            ),
          );
          break;
        case 2:
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const TeamStandingPage(),
            ),
          );
          break;
        case 3:
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const TeamOverviewPage(),
            ),
          );
          break;
        default:
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const CalendarPage(),
            ),
          );
      }
    },
    items: [
      /// Calendar
      SalomonBottomBarItem(
        icon: const Icon(Icons.calendar_month),
        title: const Text("Calendario"),
        selectedColor: AppColor.details,
      ),

      /// Team standing
      SalomonBottomBarItem(
        icon: const Icon(Icons.person),
        title: const Text("Classifica Piloti"),
        selectedColor: AppColor.details,
      ),

      /// Constructor standing
      SalomonBottomBarItem(
        icon: const Icon(Icons.car_repair),
        title: const Text("Classifica Costruttori"),
        selectedColor: AppColor.details,
      ),

      /// Teams Overview
      /*SalomonBottomBarItem(
        icon: const Icon(Icons.broadcast_on_personal),
        title: const Text("Overview Team"),
        selectedColor: AppColor.details,
      ),*/
    ],
  );
}
