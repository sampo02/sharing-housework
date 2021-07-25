import 'package:flutter/material.dart';
import 'package:sharing_housework/features/housework/presentation/widgets/create_task_button.dart';
import 'package:sharing_housework/features/housework/presentation/widgets/fetch_tasks_button.dart';
import 'package:sharing_housework/features/housework/presentation/widgets/task_form.dart';
import 'package:sharing_housework/features/housework/presentation/widgets/task_list.dart';

class TaskPage extends StatelessWidget {
  const TaskPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tasks'),
      ),
      body: Center(
          child: Column(
        children: const <Widget>[
          Expanded(child: TaskForm()),
          CreateTaskButton(),
          FetchTasksButton(),
          Expanded(child: TaskList())
        ],
      )),
    );
  }
}
