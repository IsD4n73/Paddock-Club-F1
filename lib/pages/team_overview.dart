import "package:flutter/material.dart";
import "package:paddock_club/widget/overview_tile.dart";

import "../common/bottom_bar.dart";
import "../common/colors.dart";
import "../common/team_proprietis.dart";

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
          "Overview Team",
          style: TextStyle(fontFamily: "F1Bold"),
        ),
        centerTitle: true,
      ),
      bottomNavigationBar: getBottomBar(3, context),
      body: ListView.builder(
        itemCount: listTeam.length,
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          return OverviewTile(listTeam[index]);
        },
      ),
    );
  }
}
