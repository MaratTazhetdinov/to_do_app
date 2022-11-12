import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:to_do_app/models/to_do_model.dart';
import '../repository/to_do_repository.dart';
import '../states/add_state.dart';

final todoAddPageManagerProvider =
    StateNotifierProvider.autoDispose<TodoAddPageManager, AddState>((ref) {
  final repo = ref.watch(todoRepositoryProvider);
  return TodoAddPageManager(todoRepository: repo);
});

class TodoAddPageManager extends StateNotifier<AddState> {
  final TodoRepository todoRepository;

  TodoAddPageManager({required this.todoRepository}) : super(InitialAddState());

  String? task;

  void taskFieldChanged(String task) {
    this.task = task;
    state = this.task != null && this.task!.isNotEmpty
        ? EnabledAddButtonState()
        : InitialAddState();
  }

  void addButtonPressed(DateTime? date, int projectID) async {
    todoRepository.addTodo(
        Todo(todoTask: this.task!, todoDate: date, projectID: projectID));

    print('-------------------');
    List<Todo> list = await TodoRepository.instance.getTodos;
    for (var element in list) {
      print(
          '${element.todoID}, ${element.todoTask}, ${element.todoDate}, ${element.projectID}, ${element.projectTitle}, ${element.projectColor}');
    }
    print('-------------------');
  }
}
