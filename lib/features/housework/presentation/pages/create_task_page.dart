import 'package:flutter/material.dart';

class CreateTaskPage extends StatelessWidget {
  const CreateTaskPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('New Task'),
      ),
      body: SingleChildScrollView(
        child: buildBody(context),
      ),
    );
  }

  buildBody(BuildContext context) {
  }
}
