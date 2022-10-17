import 'package:to_do_app/models/project_model.dart';

class ToDo {
  int? id;
  final String task;
  DateTime? date;
  Project? projectType;

  ToDo({this.id, required this.task, this.date, this.projectType});

  factory ToDo.fromJson(Map<String, dynamic> json) {
    return ToDo(
        id: json['todoID'],
        task: json['task'],
        date: json['date'],
        projectType: json['projectType']);
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'task': task,
    'date': date,
    'projectType': projectType
  };
}
