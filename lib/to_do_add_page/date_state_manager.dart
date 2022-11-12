import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:to_do_app/states/picker_state.dart';

final dateStateManagerProvider =
    StateNotifierProvider.autoDispose<DateStateManager, PickerState>((ref) {
  return DateStateManager();
});

class DateStateManager extends StateNotifier<PickerState> {
  DateTime? date;

  DateStateManager() : super(InitPickerState());

  void dateChanged(DateTime date) {
    state = SelectedPickerState();
    this.date = date;
  }

  void initState() {
    state = InitPickerState();
  }
}
