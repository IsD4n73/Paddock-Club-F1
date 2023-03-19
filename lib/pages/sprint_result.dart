// ignore_for_file: must_be_immutable

import "package:flutter/material.dart";
import "package:paddock_club/controller/result_api.dart";
import "package:paddock_club/model/result_model.dart";

import "../common/colors.dart";
import "../widget/standing_tile.dart";

class SprintRsultsPage extends StatefulWidget {
  String idRace;
  SprintRsultsPage(this.idRace, {super.key});

  @override
  State<SprintRsultsPage> createState() => _SprintRsultsPageState();
}

class _SprintRsultsPageState extends State<SprintRsultsPage> {
  List<RaceRsultModel> results = [];

  @override
  void initState() {
    super.initState();

    getSprintResult(widget.idRace).then((value) {
      setState(() {
        results = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.background,
      appBar: AppBar(
        backgroundColor: AppColor.background,
        title: const Text(
          "Risultati Sprint",
          style: TextStyle(fontFamily: "F1Bold"),
        ),
        centerTitle: true,
      ),
      body: results.isNotEmpty
          ? ListView.builder(
              itemCount: results.length,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: StandingTileShort(results[index]),
                );
              },
            )
          : const Center(
              child: Padding(
                padding: EdgeInsets.all(8),
                child: Text(
                  "Non sono presenti dati sulla sessione...",
                  style: TextStyle(
                    fontFamily: "F1Bold",
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
    );
  }
}
