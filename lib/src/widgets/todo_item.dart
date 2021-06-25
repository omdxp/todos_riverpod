import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todos_riverpod/src/utils/providers.dart';

class TodoItem extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final todo = watch(currentTodo);

    return Material(
      color: Colors.white,
      elevation: 6,
      child: ListTile(
        leading: Checkbox(
          value: todo.completed,
          onChanged: (value) =>
              watch(todoListProvider.notifier).toggle(todo.id),
        ),
        title: Text(todo.description),
      ),
    );
  }
}
