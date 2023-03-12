import "package:flutter/material.dart";

import "../common/bottom_bar.dart";
import "../common/colors.dart";

class DriverStandingPage extends StatefulWidget {
  const DriverStandingPage({super.key});

  @override
  State<DriverStandingPage> createState() => _DriverStandingPageState();
}

class _DriverStandingPageState extends State<DriverStandingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.background,
      appBar: AppBar(
        backgroundColor: AppColor.background,
        title: const Text(
          "Classifica Piloti",
          style: TextStyle(fontFamily: "F1Bold"),
        ),
        centerTitle: true,
      ),
      bottomNavigationBar: getBottomBar(1, context),
      body: Placeholder(),
    );
  }
}