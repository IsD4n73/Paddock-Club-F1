import "package:flutter/material.dart";

class SessionListTile extends StatelessWidget {
  String title;
  String subTitle;
  int type; // 0 : practice - 1 qualify - 2 sprint - 3 race:
  void Function()? onTap;
  SessionListTile(
      {required this.title,
      required this.subTitle,
      required this.type,
      this.onTap,
      super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        title,
        style: const TextStyle(
          fontFamily: "F1Bold",
          color: Colors.white,
          fontSize: 20,
        ),
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
      trailing: const Icon(
        Icons.arrow_forward_ios,
        color: Colors.white,
      ),
      onTap: onTap,
    );
  }
}
