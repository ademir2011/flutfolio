import 'package:flutfolio/models/trajectory.dart';
import 'package:flutter/material.dart';

class CTimeline extends StatelessWidget {
  final int index;
  final Trajectory trajectory;

  const CTimeline({
    Key? key,
    required this.index,
    required this.trajectory,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        (index % 2 == 0) ? CTimelineCard(trajectory: trajectory) : const Spacer(),
        const SizedBox(width: 75),
        Container(
          height: 300 + (trajectory.tasks.length * 15),
          child: CTimeLineTImeLine(
            index: index,
          ),
        ),
        const SizedBox(width: 75),
        (index % 2 == 0) ? const Spacer() : CTimelineCard(trajectory: trajectory),
      ],
    );
  }
}

class CTimeLineTImeLine extends StatelessWidget {
  final int index;
  const CTimeLineTImeLine({
    Key? key,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 75,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Container(
              width: 1,
              color: Theme.of(context).primaryColor,
            ),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (index % 2 == 0)
                Icon(
                  Icons.arrow_back_ios,
                  color: Theme.of(context).primaryColor,
                ),
              if (index % 2 == 0) const SizedBox(width: 5),
              Text(
                '2018',
                style: Theme.of(context).textTheme.headline2,
              ),
              if (index % 2 == 1) const SizedBox(width: 5),
              if (index % 2 == 1)
                Icon(
                  Icons.arrow_forward_ios,
                  color: Theme.of(context).primaryColor,
                ),
            ],
          ),
          const SizedBox(height: 20),
          Expanded(
            child: Container(
              width: 1,
              color: Theme.of(context).primaryColor,
            ),
          ),
        ],
      ),
    );
  }
}

class CTimelineCard extends StatelessWidget {
  final Trajectory trajectory;
  const CTimelineCard({
    Key? key,
    required this.trajectory,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.all(5),
        padding: const EdgeInsets.all(30),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: Theme.of(context).cardTheme.color,
          boxShadow: const [
            BoxShadow(
              color: Color(0xCCE5BE51),
              blurRadius: 2.5,
              spreadRadius: 0.5,
              offset: Offset(0, 0),
            ),
          ],
        ),
        child: Column(
          children: [
            Container(
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
                            '2018.1 ~ 2020.3',
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
            SizedBox(height: 20),
            ...trajectory.tasks.map((task) {
              return Padding(
                padding: const EdgeInsets.all(3),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
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
        ),
      ),
    );
  }
}
