import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_todo/features/tasks/presentation/widgets/add_task_input.dart';
import 'package:riverpod_todo/features/tasks/presentation/widgets/tasks_list.dart';
import 'package:riverpod_todo/features/tasks/providers/task_list_provider.dart';

class TasksScreen extends ConsumerStatefulWidget {
  const TasksScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _TasksScreenState();
}

class _TasksScreenState extends ConsumerState<TasksScreen> {
  @override
  Widget build(BuildContext context) {
    final tasks = ref.watch(taskListProvider);

    return Scaffold(
      body: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {
          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            builder: (BuildContext context) {
              return TasksAdd(
                onCreateTask: (name) => _createTask(name),
              );
            },
          );
        },
        child: SizedBox.expand(
          child: TasksList(
            onRemoveTask: (id) => _deleteTask(id),
            tasks: tasks,
          ),
        ),
      ),
    );
  }

  void _createTask(String name) {
    if (name.isNotEmpty) {
      ref.read(taskListProvider.notifier).addTask(
            name,
          );
    }

    Navigator.of(context).pop();
  }

  void _deleteTask(String id) {
    ref.read(taskListProvider.notifier);
  }
}
