import "package:flutter/material.dart";
import "package:paddock_club/controller/result_api.dart";
import "package:paddock_club/model/result_model.dart";
import "package:paddock_club/widget/placeholders/list_tiles.dart";

import "../common/colors.dart";
import "../widget/standing_tile.dart";

// ignore: must_be_immutable
class RaceRsultsPage extends StatefulWidget {
  String idRace;
  RaceRsultsPage(this.idRace, {super.key});

  @override
  State<RaceRsultsPage> createState() => _RaceRsultsPageState();
}

class _RaceRsultsPageState extends State<RaceRsultsPage> {
  late Future<List<RaceRsultModel>> results;

  @override
  void initState() {
    super.initState();

    results = getRaceResult(widget.idRace);
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
                        child: StandingTileShort(snapshot.data![index], widget.idRace),
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
                  );
          }
          return const ListTilesShimmer();
        },
      ),
    );
  }
}
