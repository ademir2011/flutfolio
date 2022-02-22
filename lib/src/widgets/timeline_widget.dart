import 'package:flutfolio/src/models/trajectory_model.dart';
import 'package:flutfolio/src/widgets/timeline_card_widget.dart';
import 'package:flutfolio/src/widgets/timeline_timeline_widget.dart';
import 'package:flutter/material.dart';

class TimelineWidget extends StatelessWidget {
  final int index;
  final String year;
  final List<TrajectoryModel> trajectoryList;

  const TimelineWidget({
    Key? key,
    required this.index,
    required this.year,
    required this.trajectoryList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          (index % 2 == 0)
              ? Flexible(flex: 3, child: TimelineCardWidget(trajectoryList: trajectoryList))
              : const Spacer(flex: 3),
          const SizedBox(width: 50),
          Flexible(
            flex: 1,
            child: SizedBox(
              height: 300 + (trajectoryList.length * 15),
              child: TimeLineTImeLineWidget(index: index, year: year),
            ),
          ),
          const SizedBox(width: 50),
          (index % 2 == 0)
              ? const Spacer(flex: 3)
              : Flexible(flex: 3, child: TimelineCardWidget(trajectoryList: trajectoryList)),
        ],
      ),
    );
  }
}
