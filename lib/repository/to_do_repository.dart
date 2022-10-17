import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/to_do_model.dart';

final toDoRepositoryProvider = Provider((ref) => ToDoRepository());

class ToDoRepository {
  final toDoList = <ToDo>[];

  void addToDo(ToDo task) {
    toDoList.add(task);
  }
}
