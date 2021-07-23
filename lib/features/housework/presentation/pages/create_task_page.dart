import 'package:flutter/material.dart';
import 'package:sharing_housework/features/housework/presentation/widgets/create_task_button.dart';
import 'package:sharing_housework/features/housework/presentation/widgets/fetch_tasks_button.dart';

class CreateTaskPage extends StatelessWidget {
  const CreateTaskPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('New Task'),
      ),
      body: Center(
        child: Column(
          children: const <Widget>[
            CreateTaskButton(),
            FetchTasksButton(),
          ],
        ),
      ),
    );
  }
}
