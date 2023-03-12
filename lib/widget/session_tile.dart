// ignore_for_file: must_be_immutable

import "package:flutter/material.dart";

import "../common/colors.dart";

class SessionListTile extends StatelessWidget {
  String title;
  String subTitle;
  bool isToday;
  bool nextPage;
  int type; // 0 : practice - 1 qualify - 2 sprint - 3 race:
  void Function()? onTap;
  SessionListTile({
    required this.title,
    required this.subTitle,
    required this.type,
    this.onTap,
    this.nextPage = true,
    this.isToday = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Row(
        children: [
          Text(
            title,
            style: const TextStyle(
              fontFamily: "F1Bold",
              color: Colors.white,
              fontSize: 20,
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
        ],
      ),
      subtitle: Text(
        subTitle,
        style: const TextStyle(
          fontFamily: "F1",
          color: Colors.white,
        ),
      ),
      leading: Icon(
        type == 0
            ? Icons.flag_circle_outlined
            : type == 1
                ? Icons.timer
                : type == 2
                    ? Icons.more_time_sharp
                    : Icons.flag,
        color: Colors.white,
      ),
      trailing: nextPage
          ? const Icon(
              Icons.arrow_forward_ios,
              color: Colors.white,
            )
          : const SizedBox.shrink(),
      onTap: onTap,
    );
  }
}
