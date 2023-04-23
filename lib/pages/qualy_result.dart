// ignore_for_file: must_be_immutable

import "package:flutter/material.dart";
import "package:paddock_club/common/colors.dart";
import "package:paddock_club/controller/result_api.dart";
import "package:paddock_club/widget/placeholders/list_tiles.dart";
import "package:paddock_club/widget/qualy_tile.dart";

import "../model/result_model.dart";

class QualyResultPage extends StatefulWidget {
  String idRace;
  QualyResultPage(this.idRace, {super.key});

  @override
  State<QualyResultPage> createState() => _QualyResultPageState();
}

class _QualyResultPageState extends State<QualyResultPage> {
  late Future<List<QualyRsultModel>> results;

  @override
  void initState() {
    super.initState();
    results = getQualyRsult(widget.idRace);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.background,
      appBar: AppBar(
        backgroundColor: AppColor.background,
        title: const Text(
          "Risultati Qualifiche",
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
                    shrinkWrap: true,
                    physics: const BouncingScrollPhysics(),
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: QualyTile(snapshot.data![index]),
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
