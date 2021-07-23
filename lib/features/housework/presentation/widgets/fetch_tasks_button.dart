import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sharing_housework/features/housework/presentation/models/task_model.dart';

class FetchTasksButton extends StatelessWidget {
  const FetchTasksButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<TaskModel>(builder: (_, task, __) {
      return Column(
        children: <Widget>[
          TextButton(
            onPressed: () {
              task.fetch();
            },
            child: const Text('Fetch Tasks'),
          )
        ],
      );
    });
  }
}
