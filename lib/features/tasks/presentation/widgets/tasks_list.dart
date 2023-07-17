import 'package:flutter/material.dart';
import 'package:riverpod_todo/features/tasks/domain/models/task.dart';

class TasksList extends StatelessWidget {
  const TasksList({
    super.key,
    required this.tasks,
    required this.onRemoveTask,
  });

  final List<Task> tasks;
  final Function(String) onRemoveTask;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(
            tasks[index].name,
          ),
          leading: IconButton.filled(
            onPressed: () => onRemoveTask(
              tasks[index].id,
            ),
            icon: const Icon(Icons.close),
          ),
        );
      },
      itemCount: tasks.length,
    );
  }
}
