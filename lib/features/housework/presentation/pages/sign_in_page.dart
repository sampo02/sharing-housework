import 'package:flutter/material.dart';
import 'package:sharing_housework/features/housework/presentation/widgets/sign_in_google_button.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign in'),
      ),
      body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Center(
                child: Column(
              children: const <Widget>[SignInGoogleButton()],
            )),
          ]),
    );
  }
}
