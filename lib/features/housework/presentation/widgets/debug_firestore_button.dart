import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class DebugFirestoreButton extends StatelessWidget {
  const DebugFirestoreButton({Key? key}) : super(key: key);

  _call() async {
    await FirebaseFirestore.instance
        .collection('teams')
        .doc('aMYhOr69DeezZaauo6Rm')
        .get();
    // print(res.data());
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        TextButton(
          onPressed: () {
            _call();
          },
          child: const Text('Debug'),
        )
      ],
    );
  }
}
