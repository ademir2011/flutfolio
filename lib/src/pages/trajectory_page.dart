import 'package:flutfolio/src/models/trajectory_model.dart';
import 'package:flutfolio/src/widgets/header_widget.dart';
import 'package:flutfolio/src/widgets/timeline_widget.dart';
import 'package:flutter/material.dart';

class TrajetoryPage extends StatefulWidget {
  final List<TrajectoryModel> trajectories;
  const TrajetoryPage({
    Key? key,
    required this.trajectories,
  }) : super(key: key);

  @override
  State<TrajetoryPage> createState() => _TrajetoryPageState();
}

class _TrajetoryPageState extends State<TrajetoryPage> {
  final Map<String, List<TrajectoryModel>> dataYears = {};

  @override
  void initState() {
    super.initState();
    widget.trajectories.forEach((element) {
      dataYears.update(
        element.startDate.year.toString(),
        (value) => [...value, element],
        ifAbsent: () => [element],
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const HeaderWidget(title: 'TRAJETÓRIA'),
        Expanded(
          child: ListView.builder(
            itemCount: dataYears.length,
            itemBuilder: (ctx, index) {
              return TimelineWidget(
                index: index,
                year: dataYears.keys.elementAt(index),
                trajectoryList: dataYears.values.elementAt(index),
              );
            },
          ),
        ),
      ],
    );
  }
}

class Counter {
  var i = ValueNotifier(1);
}
