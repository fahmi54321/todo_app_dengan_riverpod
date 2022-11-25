import 'package:flutter_riverpod/flutter_riverpod.dart';

enum TodoListFilter {
  all,
  active,
  completed,
}

class TodoFilter extends StateNotifier<TodoListFilter> {
  TodoFilter() : super(TodoListFilter.all);

  void changeFilter(TodoListFilter filter) {
    state = filter;
  }
}
