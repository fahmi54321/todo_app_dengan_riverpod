import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_app_dengan_riverpod/provider/todo_filter_provider.dart';
import 'package:todo_app_dengan_riverpod/provider/todo_provider.dart';

final todoProvider = StateNotifierProvider<TodoList, List<Todo>>((ref) {
  return TodoList(const [
    Todo(id: 'todo-0', description: 'hi'),
    Todo(id: 'todo-1', description: 'hello'),
    Todo(id: 'todo-2', description: 'bonjour'),
  ]);
});

final unCompletedTodosCount = Provider<int>((ref) {
  return ref.watch(todoProvider).where((todo) => !todo.completed).length;
});

final todoListFilter = StateNotifierProvider<TodoFilter, TodoListFilter>((ref) {
  return TodoFilter();
});

final filteredTodos = Provider<List<Todo>>((ref) {
  final filter = ref.watch(todoListFilter);
  final todos = ref.watch(todoProvider);

  switch (filter) {
    case TodoListFilter.completed:
      return todos.where((todo) => todo.completed).toList();
    case TodoListFilter.active:
      return todos.where((todo) => !todo.completed).toList();
    default:
      return todos;
  }
});

final currentTodo = Provider<Todo>(
  (ref) => throw UnimplementedError(),
);
