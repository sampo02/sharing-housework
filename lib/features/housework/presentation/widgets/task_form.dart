import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sharing_housework/features/housework/presentation/models/task_model.dart';

class TaskForm extends StatelessWidget {
  const TaskForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<TaskModel>(builder: (_, task, __) {
      return Scaffold(
          body: Column(
        children: <Widget>[
          TextFormField(
            onChanged: (value) => task.changeTitle(value),
            decoration: InputDecoration(
              errorText: task.titleError,
              hintText: 'New task title',
            ),
          ),
        ],
      ));
    });
  }
}
