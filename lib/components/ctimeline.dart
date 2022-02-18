import 'package:flutfolio/components/ctimeline_card.dart';
import 'package:flutfolio/components/ctimeline_timeline.dart';
import 'package:flutfolio/models/trajectory.dart';
import 'package:flutter/material.dart';

class CTimeline extends StatelessWidget {
  final int index;
  final String year;
  final List<Trajectory> trajectoryList;

  const CTimeline({
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
              ? Flexible(flex: 3, child: CTimelineCard(trajectoryList: trajectoryList))
              : const Spacer(flex: 3),
          const SizedBox(width: 50),
          Flexible(
            flex: 1,
            child: SizedBox(
              height: 300 + (trajectoryList.length * 15),
              child: CTimeLineTImeLine(index: index, year: year),
            ),
          ),
          const SizedBox(width: 50),
          (index % 2 == 0)
              ? const Spacer(flex: 3)
              : Flexible(flex: 3, child: CTimelineCard(trajectoryList: trajectoryList)),
        ],
      ),
    );
  }
}
