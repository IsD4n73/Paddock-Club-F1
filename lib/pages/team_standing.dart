import "package:flutter/material.dart";

import "../common/bottom_bar.dart";
import "../common/colors.dart";

class TeamStandingPage extends StatefulWidget {
  const TeamStandingPage({super.key});

  @override
  State<TeamStandingPage> createState() => _TeamStandingPageState();
}

class _TeamStandingPageState extends State<TeamStandingPage> {
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
      bottomNavigationBar: getBottomBar(2, context),
      body: Placeholder(),
    );
  }
}