import 'package:flutter/material.dart';
import 'package:sharing_housework/features/housework/presentation/models/task_model.dart';
import 'package:sharing_housework/injection.dart';

class FetchTasksButton extends StatelessWidget {
  const FetchTasksButton({Key? key}) : super(key: key);

  Future<void> _fetchTasks() async {
    final taskModel = instance<TaskModel>();
    await taskModel.fetch();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        TextButton(
          onPressed: () {
            _fetchTasks();
          },
          child: const Text('Fetch Tasks'),
        )
      ],
    );
  }
}
