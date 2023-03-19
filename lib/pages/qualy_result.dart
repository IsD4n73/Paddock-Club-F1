// ignore_for_file: must_be_immutable

import "package:flutter/material.dart";
import "package:paddock_club/common/colors.dart";
import "package:paddock_club/controller/result_api.dart";
import "package:paddock_club/widget/qualy_tile.dart";

import "../model/result_model.dart";

class QualyResultPage extends StatefulWidget {
  String idRace;
  QualyResultPage(this.idRace, {super.key});

  @override
  State<QualyResultPage> createState() => _QualyResultPageState();
}

class _QualyResultPageState extends State<QualyResultPage> {
  List<QualyRsultModel> results = [];

  @override
  void initState() {
    super.initState();
    getQualyRsult(widget.idRace).then((value) {
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
          "Risultati Qualifiche",
          style: TextStyle(fontFamily: "F1Bold"),
        ),
        centerTitle: true,
      ),
      body: results.isNotEmpty
          ? ListView.builder(
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            itemCount: results.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: QualyTile(results[index]),
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
