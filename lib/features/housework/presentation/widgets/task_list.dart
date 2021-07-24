import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sharing_housework/features/housework/presentation/models/task_model.dart';

class TaskList extends StatelessWidget {
  const TaskList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<TaskModel>(builder: (_, task, __) {
      return ListView.builder(
          itemCount: task.items.length,
          itemBuilder: (BuildContext context, int index) {
            return Center(
                child: Text('Task title: ${task.items[index].title}'));
          });
    });
  }
}
