import 'package:flutter_riverpod/flutter_riverpod.dart';

class FilterNotifier extends Notifier<List<String>> {
  @override
  List<String> build() => []; //inital state

  void toggleFilter(String filter) {
    if (state.contains(filter)) {
      state = state.where((f) => f != filter).toList(); // remove if already selected
    } else {
      state = [...state, filter]; // add if not selected
    }
  }

  void resetFilters() => {state = []};
}