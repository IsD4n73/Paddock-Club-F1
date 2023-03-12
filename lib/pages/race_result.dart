import "package:flutter/material.dart";
import "package:paddock_club/controller/result_api.dart";
import "package:paddock_club/model/result_model.dart";

import "../common/colors.dart";
import "../widget/standing_tile.dart";

class RaceRsultsPage extends StatefulWidget {
  String idRace;
  RaceRsultsPage(this.idRace, {super.key});

  @override
  State<RaceRsultsPage> createState() => _RaceRsultsPageState();
}

class _RaceRsultsPageState extends State<RaceRsultsPage> {
  List<RaceRsultModel> results = [];

  @override
  void initState() {
    super.initState();

    getRaceResult(widget.idRace).then((value) {
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
          "Risultati Sessione",
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
