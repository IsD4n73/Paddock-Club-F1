import "package:flutter/material.dart";
import "package:paddock_club/controller/standing_api.dart";

import "../common/bottom_bar.dart";
import "../common/colors.dart";
import "../controller/utils.dart";
import "../model/standing_model.dart";

class TeamStandingPage extends StatefulWidget {
  const TeamStandingPage({super.key});

  @override
  State<TeamStandingPage> createState() => _TeamStandingPageState();
}

class _TeamStandingPageState extends State<TeamStandingPage> {
  List<TeamStandModel> teams = [];

  @override
  void initState() {
    super.initState();

    getTeamStanding().then((value) {
      setState(() {
        teams = value;
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
          "Classifica Costruttori",
          style: TextStyle(fontFamily: "F1Bold"),
        ),
        centerTitle: true,
      ),
      bottomNavigationBar: getBottomBar(2, context),
      body: teams.isNotEmpty
          ? ListView.builder(
              itemCount: teams.length,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border(
                        left: BorderSide(
                            width: 4,
                            color: getTeamColor(teams[index].name)!),
                      ),
                    ),
                    child: ListTile(
                      tileColor: AppColor.secondary,
                      title: Text(
                        teams[index].name,
                        style: const TextStyle(
                          fontFamily: "F1Bold",
                          color: Colors.white,
                        ),
                      ),
                      subtitle: Text(
                        "Vittorie: ${teams[index].wins}",
                        style: const TextStyle(
                          fontFamily: "F1",
                          color: Colors.white,
                        ),
                      ),
                      leading: CircleAvatar(
                        backgroundColor:
                            getTeamColor(teams[index].name),
                        child: Text(
                          teams[index].position,
                          style: const TextStyle(
                            fontFamily: "F1Bold",
                          ),
                        ),
                      ),
                      trailing: Text(
                        teams[index].points,
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
                  "Non sono presenti dati sui costruttori...",
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
