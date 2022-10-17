import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:to_do_app/main_page/main_page_manager.dart';
import 'package:to_do_app/models/to_do_model.dart';
import 'package:to_do_app/repository/project_repository.dart';
import 'package:to_do_app/repository/to_do_repository.dart';
import 'package:to_do_app/todo_page/to_do_state.dart';

import '../models/project_model.dart';

final toDoManagerProvider =
    StateNotifierProvider<ToDoManager, ToDoState>((ref) {
  final toDoRepo = ref.read(toDoRepositoryProvider);
  final projectRepo = ref.read(projectRepositoryProvider);
  return ToDoManager(toDoRepository: toDoRepo, projectRepository: projectRepo);
});

class ToDoManager extends StateNotifier<ToDoState> {
  final ToDoRepository toDoRepository;
  final ProjectRepository projectRepository;

  ToDoManager({required this.toDoRepository, required this.projectRepository})
      : super(InitialToDoState());

  void addNewToDo(String task, DateTime? date, Project? projectType) {
    if (task.isNotEmpty) {
      final toDo = ToDo(task: task, date: date, projectType: projectType);
      toDoRepository.addToDo(toDo);
      state = SuccessfulToDoState();
    } else {
      state = ErrorToDoState();
    }
  }
}
