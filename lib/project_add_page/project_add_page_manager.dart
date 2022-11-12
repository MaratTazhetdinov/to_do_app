import 'dart:ui';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:to_do_app/repository/project_repository.dart';
import 'package:to_do_app/states/add_state.dart';
import '../models/project_model.dart';

final projectAddPageManagerProvider =
    StateNotifierProvider.autoDispose<ProjectAddPageManager, AddState>((ref) {
  final repo = ref.watch(projectRepositoryProvider);
  return ProjectAddPageManager(projectRepository: repo);
});

class ProjectAddPageManager extends StateNotifier<AddState> {
  final ProjectRepository projectRepository;

  ProjectAddPageManager({required this.projectRepository})
      : super(InitialAddState());

  String? name;
  Color? color;

  void nameFieldChanged(String? name) {
    this.name = name;
    state = this.name == null || this.color == null || this.name!.isEmpty
        ? InitialAddState()
        : EnabledAddButtonState();
  }

  void colorChanged() {
    state = this.name == null || this.color == null || this.name!.isEmpty
        ? InitialAddState()
        : EnabledAddButtonState();
  }

  void addButtonPressed() async {
    projectRepository
        .addProject(Project(projectTitle: name!, projectColor: color!.value));
  }
}
