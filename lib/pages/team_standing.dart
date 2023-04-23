import "package:flutter/material.dart";
import "package:paddock_club/controller/standing_api.dart";
import "package:paddock_club/widget/placeholders/list_tiles.dart";
import "package:paddock_club/widget/placeholders/no_data.dart";

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
  late Future<List<TeamStandModel>> teams;

  @override
  void initState() {
    super.initState();

    teams = getTeamStanding();
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
        body: FutureBuilder(
          future: teams,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return snapshot.data!.isNotEmpty
                  ? ListView.builder(
                      itemCount: snapshot.data!.length,
                      physics: const BouncingScrollPhysics(),
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border(
                                left: BorderSide(
                                    width: 4,
                                    color: getTeamColor(snapshot.data![index].name)!),
                              ),
                            ),
                            child: ListTile(
                              tileColor: AppColor.secondary,
                              title: Text(
                                snapshot.data![index].name,
                                style: const TextStyle(
                                  fontFamily: "F1Bold",
                                  color: Colors.white,
                                ),
                              ),
                              subtitle: Text(
                                "Vittorie: ${snapshot.data![index].wins}",
                                style: const TextStyle(
                                  fontFamily: "F1",
                                  color: Colors.white,
                                ),
                              ),
                              leading: CircleAvatar(
                                backgroundColor:
                                    getTeamColor(snapshot.data![index].name),
                                child: Text(
                                  snapshot.data![index].position,
                                  style: const TextStyle(
                                    fontFamily: "F1Bold",
                                  ),
                                ),
                              ),
                              trailing: Text(
                                snapshot.data![index].points,
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
                  : const NoDataConstructor();
            }
            return const ListTilesShimmer();
          },
        ));
  }
}
