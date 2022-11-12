import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:to_do_app/states/repository_state.dart';

final repositoryManagerProvider =
    StateNotifierProvider<RepositoryManager, RepositoryState>((ref) {
  return RepositoryManager();
});

class RepositoryManager extends StateNotifier<RepositoryState> {
  RepositoryManager() : super(InitialRepositoryState());

  void changedRepository() async {
    state = ChangedRepositoryState();
  }
}
