import "package:flutter/material.dart";
import "package:paddock_club/controller/standing_api.dart";
import "package:paddock_club/controller/utils.dart";
import "package:paddock_club/widget/placeholders/no_data.dart";

import "../common/bottom_bar.dart";
import "../common/colors.dart";
import "../model/standing_model.dart";
import "../widget/placeholders/list_tiles.dart";

class DriverStandingPage extends StatefulWidget {
  const DriverStandingPage({super.key});

  @override
  State<DriverStandingPage> createState() => _DriverStandingPageState();
}

class _DriverStandingPageState extends State<DriverStandingPage> {
  late Future<List<DriverStandModel>> drivers;

  @override
  void initState() {
    super.initState();

    drivers = getDriverStanding();
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
        body: FutureBuilder(
          future: drivers,
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
                                    color: getTeamColor(
                                        snapshot.data![index].constructor)!),
                              ),
                            ),
                            child: ListTile(
                              tileColor: AppColor.secondary,
                              title: Text(
                                snapshot.data![index].driverCode,
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
                                    getTeamColor(snapshot.data![index].constructor),
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
                  : const NoDataPilot();
            }
            return const ListTilesShimmer();
          },
        ));
  }
}
