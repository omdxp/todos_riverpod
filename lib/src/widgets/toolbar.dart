import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todos_riverpod/src/utils/providers.dart';

class Toolbar extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final filter = watch(todoListFilter);

    Color? textColorFor(TodoListFilter value) {
      return filter.state == value ? Colors.blue : null;
    }

    return Material(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
              child: Text(
            '${watch(uncompletedTodosCount).toString()} items left',
            overflow: TextOverflow.ellipsis,
          )),
          TextButton(
            onPressed: () => filter.state = TodoListFilter.all,
            child: const Text('All'),
          ),
          TextButton(
              onPressed: () => filter.state = TodoListFilter.completed,
              child: const Text('Completed')),
          TextButton(
              onPressed: () => filter.state = TodoListFilter.active,
              child: const Text('Active'))
        ],
      ),
    );
  }
}
