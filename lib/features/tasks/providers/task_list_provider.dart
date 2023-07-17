import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_todo/features/tasks/domain/enums/task_status.dart';
import 'package:riverpod_todo/features/tasks/domain/models/task.dart';
import 'package:uuid/uuid.dart';

final taskListProvider = StateNotifierProvider<TaskListNotifier, List<Task>>(
  (ref) => TaskListNotifier(),
);

class TaskListNotifier extends StateNotifier<List<Task>> {
  TaskListNotifier() : super([]);

  void addTask(String name) {
    final task = Task(
      id: const Uuid().v4(),
      name: name,
      status: TaskStatus.todo,
    );

    state = [...state, task];
  }

  void deleteTask(String id) {
    final tasks = [...state];

    tasks.removeWhere((element) => element.id == id);

    state = tasks;
  }
}
