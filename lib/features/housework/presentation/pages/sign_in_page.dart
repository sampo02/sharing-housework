import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sharing_housework/features/housework/presentation/models/user_model.dart';
import 'package:sharing_housework/features/housework/presentation/widgets/sign_in_google_button.dart';
import 'package:sharing_housework/injection.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign in'),
      ),
      body: ChangeNotifierProvider(
        create: (context) => instance<UserModel>(),
        child: Center(
            child: Column(
          children: const <Widget>[SignInGoogleButton()],
        )),
      ),
    );
  }
}
