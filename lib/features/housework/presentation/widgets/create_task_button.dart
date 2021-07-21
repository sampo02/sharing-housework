import 'package:flutter/material.dart';
import 'package:sharing_housework/features/housework/domain/entities/task.dart';
import 'package:sharing_housework/features/housework/domain/usecases/create_task_usecase.dart';
import 'package:sharing_housework/injection.dart';

class CreateTaskButton extends StatelessWidget {
  const CreateTaskButton({Key? key}) : super(key: key);

  Future<void> _createTask() async {
    final createTaskUsecase = instance<CreateTaskUsecase>();
    await createTaskUsecase.call(Task(name: 'New Task'));
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
