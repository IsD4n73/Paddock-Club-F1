// ignore_for_file: must_be_immutable

import "package:flutter/material.dart";
import "package:paddock_club/common/colors.dart";
import "package:paddock_club/model/team_structure_model.dart";

import "../controller/utils.dart";

class OverviewTile extends StatelessWidget {
  TeamStructure team;
  OverviewTile(this.team, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          color: AppColor.secondary,
          border: Border(
            left: BorderSide(
                width: 4, color: getTeamColor(team.teamName)!),
          ),
        ),
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text(
              team.teamName,
              overflow: TextOverflow.clip,
              style: const TextStyle(
                fontFamily: "F1Bold",
                color: Colors.white,
                fontSize: 20,
              ),
            ),
            CircleAvatar(
              backgroundColor: Colors.white,
              child: Image.asset(
                team.teamLogo,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  team.piloteOne,
                  overflow: TextOverflow.clip,
                  style: const TextStyle(
                    fontFamily: "F1Bold",
                    color: Colors.white,
                    fontSize: 14,
                  ),
                ),
                Text(
                  team.piloteTwo,
                  overflow: TextOverflow.clip,
                  style: const TextStyle(
                    fontFamily: "F1Bold",
                    color: Colors.white,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
