class Trajectory {
  final String title;
  final DateTime startDate;
  final DateTime? endDate;
  final List<String> tasks;

  Trajectory({
    required this.title,
    required this.startDate,
    this.endDate,
    this.tasks = const [],
  });
}
