import 'package:flutter/material.dart';

class CreateTaskPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Task'),
      ),
      body: SingleChildScrollView(
        child: buildBody(context),
      ),
    );
  }

  buildBody(BuildContext context) {

  }
}
