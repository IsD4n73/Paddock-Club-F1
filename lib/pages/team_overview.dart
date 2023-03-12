import "package:flutter/material.dart";

import "../common/bottom_bar.dart";
import "../common/colors.dart";


class TeamOverviewPage extends StatefulWidget {
  const TeamOverviewPage({super.key});

  @override
  State<TeamOverviewPage> createState() => _TeamOverviewPageState();
}

class _TeamOverviewPageState extends State<TeamOverviewPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.background,
      appBar: AppBar(
        backgroundColor: AppColor.background,
        title: const Text(
          "Classifica Costruttori",
          style: TextStyle(fontFamily: "F1Bold"),
        ),
        centerTitle: true,
      ),
      bottomNavigationBar: getBottomBar(3, context),
      body: Placeholder(),
    );
  }
}