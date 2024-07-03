class TaskModel {
  int? id;
  String title;
  String note;
  String date;
  String? startTime;
  String? endTime;
  String remind;
  String repeat;
  int color;
  TaskModel(
      {required this.title,
      required this.note,
      required this.date,
      this.startTime,
      this.endTime,
      required this.remind,
      required this.repeat,
      required this.color});
}
