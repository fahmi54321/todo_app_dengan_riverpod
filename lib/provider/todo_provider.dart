import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';

const _uuid = Uuid();

@immutable
class Todo {
  final String id;
  final String description;
  final bool completed;
  const Todo({
    required this.id,
    required this.description,
    this.completed = false,
  });

  @override
  String toString() =>
      'Todo(id: $id, description: $description, completed: $completed)';
}

class TodoList extends StateNotifier<List<Todo>> {
  TodoList([List<Todo>? initialTodos])
      : super(
          initialTodos ?? [],
        );

  void add(String description) {
    state = [
      ...state,
      Todo(
        id: _uuid.v4(),
        description: description,
      ),
    ];

    log('listtt : $state');
  }

  void toggle(String id) {
    state = [
      for (final todo in state)
        (todo.id == id)
            ? Todo(
                id: todo.id,
                completed: !todo.completed,
                description: todo.description,
              )
            : todo,
    ];
  }

  void edit({required String id, required String description}) {
    state = [
      for (final todo in state)
        (todo.id == id)
            ? Todo(
                id: todo.id,
                completed: todo.completed,
                description: description,
              )
            : todo
    ];
  }

  void remove(Todo target) {
    state = state.where((Todo todo) => todo.id != target.id).toList();
  }
}
