import "package:bottom_sheet/bottom_sheet.dart";
import "package:flutter/material.dart";
import "package:paddock_club/common/colors.dart";

import "../model/pit_model.dart";

void showPitstop(BuildContext context, List<PitModel> pitstops) {
  showFlexibleBottomSheet(
    minHeight: 0,
    initHeight: 0.5,
    maxHeight: 1,
    bottomSheetColor: AppColor.background,
    context: context,
    barrierColor: Colors.black38,
    builder: (context, scrollController, bottomSheetOffset) {
      return Column(
        children: [
          const Text(
            "PITSTOPS",
            style: TextStyle(
              fontFamily: "F1Bold",
              color: Colors.white,
              fontSize: 25,
            ),
          ),
          ListView.builder(
            itemCount: pitstops.length,
            physics: const BouncingScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return Card(
                color: AppColor.secondary,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "- Pitstop n: ${pitstops[index].stop}",
                        style: const TextStyle(
                          fontFamily: "F1",
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        "- Durata: ${pitstops[index].duration}",
                        style: const TextStyle(
                          fontFamily: "F1",
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        "- Giro: ${pitstops[index].lap}",
                        style: const TextStyle(
                          fontFamily: "F1",
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      );
    },
    anchors: [0, 0.5, 1],
    isSafeArea: true,
  );
}
