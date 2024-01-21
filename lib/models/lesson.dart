class LessonModel {
  String name;
  String instructor;
  List<DateTime>? dates;
  LessonModel({
    required this.name,
    required this.instructor,
    this.dates,
  });
}
