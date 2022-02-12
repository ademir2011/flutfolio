import 'package:flutfolio/components/ctimeline.dart';
import 'package:flutfolio/models/trajectory.dart';
import 'package:flutter/material.dart';

class TrajetoryPage extends StatelessWidget {
  const TrajetoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final trajectories = [
      Trajectory(title: 'Empresa tal 1', startDate: DateTime.now(), endDate: DateTime.now(), tasks: [
        'Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum ',
        'Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum ',
        'Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum '
      ]),
      Trajectory(title: 'Empresa tal 1', startDate: DateTime.now(), endDate: DateTime.now(), tasks: [
        'Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum ',
        'Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum '
      ]),
      Trajectory(title: 'Empresa tal 1', startDate: DateTime.now(), endDate: DateTime.now(), tasks: [
        'Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum ',
        'Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum ',
        'Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum ',
        'Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum ',
        'Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum '
      ]),
      Trajectory(title: 'Empresa tal 1', startDate: DateTime.now(), endDate: DateTime.now(), tasks: [
        'Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum ',
        'Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum '
      ]),
      Trajectory(title: 'Empresa tal 1', startDate: DateTime.now(), endDate: DateTime.now(), tasks: [
        'Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum ',
        'Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum '
      ]),
    ];

    return Container(
      height: 300,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Trajetória',
            style: Theme.of(context).textTheme.headline1,
          ),
          const SizedBox(height: 10),
          const Divider(indent: 0, endIndent: 0, height: 0.5),
          const SizedBox(height: 20),
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
