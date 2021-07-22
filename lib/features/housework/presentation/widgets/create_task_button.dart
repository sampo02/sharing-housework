import 'package:flutter/material.dart';
import 'package:sharing_housework/features/housework/presentation/models/task_model.dart';
import 'package:sharing_housework/injection.dart';

class CreateTaskButton extends StatelessWidget {
  const CreateTaskButton({Key? key}) : super(key: key);

  Future<void> _createTask() async {
    final taskModel = instance<TaskModel>();
    await taskModel.create('New Task');
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        TextButton(
          onPressed: () {
            _createTask();
          },
          child: const Text('Add New Task'),
        )
      ],
    );
  }
}
