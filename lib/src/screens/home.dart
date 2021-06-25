import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todos_riverpod/src/utils/providers.dart';
import 'package:todos_riverpod/src/widgets/title.dart';
import 'package:todos_riverpod/src/widgets/todo_item.dart';
import 'package:todos_riverpod/src/widgets/toolbar.dart';

class Home extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final todos = watch(filteredTodos);
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 40),
          children: [
            TitleWidget(),
            const SizedBox(
              height: 42,
            ),
            Toolbar(),
            if (todos.isNotEmpty)
              const Divider(
                height: 0,
              ),
            for (var i = 0; i < todos.length; i++) ...[
              if (i > 0)
                const Divider(
                  height: 0,
                ),
              ProviderScope(
                  overrides: [currentTodo.overrideWithValue(todos[i])],
                  child: TodoItem())
            ]
          ],
        ),
      ),
    );
  }
}
