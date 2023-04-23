// ignore_for_file: must_be_immutable

import "package:flutter/material.dart";
import "package:paddock_club/controller/result_api.dart";
import "package:paddock_club/model/result_model.dart";
import "package:paddock_club/widget/placeholders/list_tiles.dart";
import "package:paddock_club/widget/placeholders/no_data.dart";

import "../common/colors.dart";
import "../widget/standing_tile.dart";

class SprintRsultsPage extends StatefulWidget {
  String idRace;
  SprintRsultsPage(this.idRace, {super.key});

  @override
  State<SprintRsultsPage> createState() => _SprintRsultsPageState();
}

class _SprintRsultsPageState extends State<SprintRsultsPage> {
  late Future<List<RaceRsultModel>> results;

  @override
  void initState() {
    super.initState();

    results = getSprintResult(widget.idRace);
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
      body: FutureBuilder(
        future: results,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return snapshot.data!.isNotEmpty
                ? ListView.builder(
                    itemCount: snapshot.data!.length,
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: StandingTileShort(snapshot.data![index]),
                      );
                    },
                  )
                : const NoDataSession();
          }
          return const ListTilesShimmer();
        },
      ),
    );
  }
}
