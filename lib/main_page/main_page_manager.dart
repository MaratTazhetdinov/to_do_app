import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:to_do_app/models/to_do_model.dart';
import 'package:to_do_app/repository/project_repository.dart';
import 'package:to_do_app/repository/to_do_repository.dart';
import 'package:to_do_app/todo_page/to_do_state.dart';

import '../models/project_model.dart';

final mainPageManagerProvider =
    StateNotifierProvider<MainPageManager, int>((ref) {
  final toDoRepo = ref.read(toDoRepositoryProvider);
  final projectRepo = ref.read(projectRepositoryProvider);
  return MainPageManager(
      toDoRepository: toDoRepo, projectRepository: projectRepo);
});

class MainPageManager extends StateNotifier<int> {
  final ToDoRepository toDoRepository;
  final ProjectRepository projectRepository;

  MainPageManager(
      {required this.toDoRepository, required this.projectRepository})
      : super(toDoRepository.toDoList.length);

  
}
