import 'package:flutfolio/src/models/trajectory_model.dart';
import 'package:flutfolio/src/widgets/card_generic_widget.dart';
import 'package:flutter/material.dart';

class TimelineCardWidget extends StatelessWidget {
  final List<TrajectoryModel> trajectoryList;
  const TimelineCardWidget({
    Key? key,
    required this.trajectoryList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CardGenericWidget(
      child: Column(
        children: List.generate(
          trajectoryList.length,
          (index) {
            return (trajectoryList.length - 1 != index)
                ? Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: CTimelineCardTile(trajectory: trajectoryList[index]),
                  )
                : CTimelineCardTile(trajectory: trajectoryList[index]);
          },
        ),
      ),
    );
  }
}

class CTimelineCardTile extends StatelessWidget {
  const CTimelineCardTile({
    Key? key,
    required this.trajectory,
  }) : super(key: key);

  final TrajectoryModel trajectory;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 25,
          child: Row(
            children: [
              Flexible(
                fit: FlexFit.tight,
                flex: 3,
                child: Text(
                  trajectory.entepriseName,
                  style: Theme.of(context).textTheme.headline2,
                ),
              ),
              Flexible(
                fit: FlexFit.tight,
                flex: 1,
                child: Row(
                  children: [
                    Container(
                      width: 1,
                      color: Colors.white,
                    ),
                    const SizedBox(width: 10),
                    Flexible(
                      child: Text(
                        '${trajectory.startDate.year} ~ ${trajectory.endDate?.year ?? ''}',
                        style: Theme.of(context).textTheme.headline4,
                        overflow: TextOverflow.visible,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
        const SizedBox(height: 20),
        ...trajectory.tasks.map((task) {
          return Padding(
            padding: const EdgeInsets.all(3),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Icon(
                  Icons.subdirectory_arrow_right,
                ),
                const SizedBox(width: 10),
                Flexible(
                  child: Text(
                    task,
                    style: Theme.of(context).textTheme.headline4,
                  ),
                ),
              ],
            ),
          );
        }).toList(),
      ],
    );
  }
}
