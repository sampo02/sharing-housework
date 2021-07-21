import 'package:flutter/material.dart';
import 'package:sharing_housework/features/housework/presentation/widgets/create_task_button.dart';

class CreateTaskPage extends StatelessWidget {
  const CreateTaskPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('New Task'),
      ),
      body: const SingleChildScrollView(
        child: CreateTaskButton(),
      ),
    );
  }
}
