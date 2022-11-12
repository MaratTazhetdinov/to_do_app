import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:to_do_app/models/project_model.dart';
import 'package:to_do_app/states/picker_state.dart';

final projectStateManagerProvider =
    StateNotifierProvider.autoDispose<ProjectStateManager, PickerState>((ref) {
  return ProjectStateManager();
});

class ProjectStateManager extends StateNotifier<PickerState> {
  int projectID = 1;
  String? projectTitle;
  int? projectColor;

  ProjectStateManager() : super(InitPickerState());

  void projectChanged(Project project) {
    if (project.projectID != 1) {
      state = SelectedPickerState();
      this.projectID = project.projectID!;
      this.projectTitle = project.projectTitle;
      this.projectColor = project.projectColor;
    } else {
      state = InitPickerState();
    }
    print(state.runtimeType);
  }

  void initState() {
    state = InitPickerState();
  }
}
