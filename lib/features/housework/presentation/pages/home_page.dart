import 'package:flutter/material.dart';
import 'package:sharing_housework/features/housework/presentation/widgets/user_icon.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        leading: const UserIcon(),
        actions: <Widget>[
          IconButton(onPressed: () => {}, icon: const Icon(Icons.settings))
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/sign_in');
                },
                child: const Text('Sign in')),
            TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/tasks');
                },
                child: const Text('Tasks')),
          ],
        ),
      ),
    );
  }
}
