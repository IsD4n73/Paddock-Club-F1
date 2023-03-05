import "package:flutter/material.dart";
import "package:paddock_club/common/colors.dart";
import "package:paddock_club/controller/utils.dart";
import "package:paddock_club/model/calendar_model.dart";
import "package:paddock_club/pages/session_select.dart";

// ignore: must_be_immutable
class CalendarListTile extends StatelessWidget {
  RaceScheduleModel race;
  bool isToday;

  CalendarListTile(this.race, this.isToday, {super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => SessionSelectPage(race)),
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: AppColor.secondary,
            border: Border.all(
              color: isToday ? AppColor.details : Colors.transparent,
            ),
            borderRadius: const BorderRadius.all(
              Radius.circular(15),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "${race.date},",
                          style: const TextStyle(
                            fontFamily: "F1",
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          " ${race.time}",
                          style: const TextStyle(
                            fontFamily: "F1",
                            color: Colors.white,
                          ),
                        ),
                        isToday
                            ? Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: Container(
                                  padding: const EdgeInsets.all(3),
                                  decoration: const BoxDecoration(
                                    color: AppColor.details,
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(10),
                                    ),
                                  ),
                                  child: const Text(
                                    "OGGI",
                                    style: TextStyle(
                                      fontFamily: "F1Bold",
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              )
                            : const SizedBox.shrink(),
                        race.haveSprint ?? false
                            ? Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: Container(
                                  padding: const EdgeInsets.all(3),
                                  decoration: const BoxDecoration(
                                    color: AppColor.detailsSecondary,
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(10),
                                    ),
                                  ),
                                  child: const Text(
                                    "+SPRINT",
                                    style: TextStyle(
                                      fontFamily: "F1Bold",
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              )
                            : const SizedBox.shrink(),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      Image.asset(
                        getFlagFromName(race.country),
                        width: 25,
                        height: 25,
                        errorBuilder: (context, error, stackTrace) =>
                            const Icon(
                          Icons.flag,
                          color: Colors.white,
                        ),
                        package: 'country_icons',
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8),
                        child: Text(
                          race.raceName,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                              fontFamily: "F1Bold",
                              color: Colors.white,
                              fontSize: 16),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const Icon(Icons.arrow_forward_ios, color: Colors.white),
            ],
          ),
        ),
      ),
    );
  }
}
