import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/to_do_model.dart';
import '../repository/to_do_repository.dart';
import '../states/add_state.dart';

final searchPageManagerProvider =
    StateNotifierProvider<searchPageManager, int>((ref) {
  final repo = ref.watch(todoRepositoryProvider);
  return searchPageManager(todoRepository: repo);
});

class searchPageManager extends StateNotifier<int> {
  final TodoRepository todoRepository;

  searchPageManager({required this.todoRepository}) : super(0);

  String? task;

  void searchFieldChanged(String task) async {
    this.task = task;
    state = task.length;
  }
}
