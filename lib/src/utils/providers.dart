import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todos_riverpod/src/models/todo.dart';
import 'package:todos_riverpod/src/utils/notifiers.dart';

final todoListProvider = StateNotifierProvider<TodoList, List<Todo>>((ref) {
  return TodoList([
    Todo(description: 'hi', id: 'todo-0'),
    Todo(description: 'hello', id: 'todo-1'),
    Todo(description: 'bonjour', id: 'todo-2')
  ]);
});

enum TodoListFilter { all, active, completed }

final todoListFilter = StateProvider((_) => TodoListFilter.all);

final uncompletedTodosCount = Provider<int>((ref) {
  return ref.watch(todoListProvider).where((todo) => !todo.completed).length;
});

final filteredTodos = Provider<List<Todo>>((ref) {
  final filter = ref.watch(todoListFilter);
  final todos = ref.watch(todoListProvider);

  switch (filter.state) {
    case TodoListFilter.completed:
      return todos.where((todo) => todo.completed).toList();
    case TodoListFilter.active:
      return todos.where((todo) => !todo.completed).toList();
    case TodoListFilter.all:
    default:
      return todos;
  }
});

final currentTodo = ScopedProvider<Todo>(null);
