import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sharing_housework/features/housework/presentation/models/task_model.dart';
import 'package:sharing_housework/features/housework/presentation/widgets/create_task_button.dart';
import 'package:sharing_housework/features/housework/presentation/widgets/fetch_tasks_button.dart';
import 'package:sharing_housework/features/housework/presentation/widgets/task_form.dart';
import 'package:sharing_housework/features/housework/presentation/widgets/task_list.dart';
import 'package:sharing_housework/injection.dart';

class CreateTaskPage extends StatelessWidget {
  const CreateTaskPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('New Task'),
      ),
      body: ChangeNotifierProvider(
        create: (context) => instance<TaskModel>(),
        child: Center(
            child: Column(
          children: const <Widget>[
            Expanded(child: TaskForm()),
            CreateTaskButton(),
            FetchTasksButton(),
            Expanded(child: TaskList())
          ],
        )),
      ),
    );
  }
}
