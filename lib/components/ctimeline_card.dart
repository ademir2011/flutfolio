import 'package:flutfolio/components/ccard_generic.dart';
import 'package:flutfolio/models/trajectory.dart';
import 'package:flutter/material.dart';

class CTimelineCard extends StatelessWidget {
  final List<Trajectory> trajectoryList;
  const CTimelineCard({
    Key? key,
    required this.trajectoryList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CCardGeneric(
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

  final Trajectory trajectory;

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
