import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

var _uuid = Uuid();

@immutable
class Todo {
  final String id;
  final String description;
  final bool completed;

  Todo({required this.description, required this.id, this.completed = false});

  @override
  String toString() {
    return 'Todo(description: $description, completed: $completed)';
  }
}
