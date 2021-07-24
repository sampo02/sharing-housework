import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sharing_housework/features/housework/presentation/models/task_model.dart';

class CreateTaskButton extends StatelessWidget {
  const CreateTaskButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<TaskModel>(builder: (_, task, __) {
      return Column(
        children: <Widget>[
          TextButton(
            onPressed: () {
              task.create();
            },
            child: const Text('Add New Task'),
          )
        ],
      );
    });
  }
}
