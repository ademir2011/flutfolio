class Trajectory {
  final String entepriseName;
  final String position;
  final DateTime startDate;
  final DateTime? endDate;
  final List<String> tasks;

  Trajectory({
    required this.entepriseName,
    required this.position,
    required this.startDate,
    this.endDate,
    this.tasks = const [],
  });
}
