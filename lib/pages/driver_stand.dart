import "package:flutter/material.dart";
import "package:paddock_club/controller/standing_api.dart";
import "package:paddock_club/controller/utils.dart";

import "../common/bottom_bar.dart";
import "../common/colors.dart";
import "../model/standing_model.dart";

class DriverStandingPage extends StatefulWidget {
  const DriverStandingPage({super.key});

  @override
  State<DriverStandingPage> createState() => _DriverStandingPageState();
}

class _DriverStandingPageState extends State<DriverStandingPage> {
  List<DriverStandModel> drivers = [];

  @override
  void initState() {
    super.initState();

    getDriverStanding().then((value) {
      setState(() {
        drivers = value;
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
          "Classifica Piloti",
          style: TextStyle(fontFamily: "F1Bold"),
        ),
        centerTitle: true,
      ),
      bottomNavigationBar: getBottomBar(1, context),
      body: drivers.isNotEmpty
          ? ListView.builder(
              itemCount: drivers.length,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border(
                        left: BorderSide(
                            width: 4,
                            color: getTeamColor(drivers[index].constructor)!),
                      ),
                    ),
                    child: ListTile(
                      tileColor: AppColor.secondary,
                      title: Text(
                        drivers[index].driverCode,
                        style: const TextStyle(
                          fontFamily: "F1Bold",
                          color: Colors.white,
                        ),
                      ),
                      subtitle: Text(
                        "Vittorie: ${drivers[index].wins}",
                        style: const TextStyle(
                          fontFamily: "F1",
                          color: Colors.white,
                        ),
                      ),
                      leading: CircleAvatar(
                        backgroundColor:
                            getTeamColor(drivers[index].constructor),
                        child: Text(
                          drivers[index].position,
                          style: const TextStyle(
                            fontFamily: "F1Bold",
                          ),
                        ),
                      ),
                      trailing: Text(
                        drivers[index].points,
                        style: const TextStyle(
                          fontFamily: "F1Bold",
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                );
              },
            )
          : const Center(
              child: Padding(
                padding: EdgeInsets.all(8),
                child: Text(
                  "Non sono presenti dati sui piloti...",
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
