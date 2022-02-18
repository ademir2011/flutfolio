import 'package:flutfolio/components/cheader.dart';
import 'package:flutfolio/components/ctimeline.dart';
import 'package:flutfolio/models/trajectory.dart';
import 'package:flutter/material.dart';

class TrajetoryPage extends StatelessWidget {
  final List<Trajectory> trajectories;
  const TrajetoryPage({
    Key? key,
    required this.trajectories,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CHeader(title: 'TRAJETÓRIA'),
          Expanded(
            child: ListView.builder(
              itemCount: trajectories.length,
              itemBuilder: (ctx, index) {
                return CTimeline(
                  index: index,
                  trajectory: trajectories[index],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
