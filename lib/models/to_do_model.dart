import 'dart:ui';

import 'package:intl/intl.dart';

class Todo {
  int? todoID;
  String todoTask;
  DateTime? todoDate;
  int todoCompletion;
  int? projectID;
  String? projectTitle;
  int? projectColor;

  Todo(
      {this.todoID,
      required this.todoTask,
      this.todoDate,
      this.todoCompletion = 0,
      this.projectID,
      this.projectTitle,
      this.projectColor});

  factory Todo.fromJson(Map<String, dynamic> json) {
    return Todo(
        todoID: json['todoID'],
        todoTask: json['todoTask'],
        todoDate: DateTime.tryParse(json['todoDate']),
        todoCompletion: json['todoCompletion'],
        projectID: json['projectID'],
        projectTitle: json['projectTitle'],
        projectColor: json['projectColor']);
  }

  Map<String, dynamic> toJson() => {
        'todoTask': todoTask,
        'todoDate': todoDate == null ? null : todoDate!.toString(),
        'todoCompletion': todoCompletion,
        'projectID': projectID,
      };
}
