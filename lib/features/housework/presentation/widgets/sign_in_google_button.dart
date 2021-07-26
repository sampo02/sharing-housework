import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:sharing_housework/features/housework/core/exceptions/exception.dart';
import 'package:sharing_housework/features/housework/presentation/models/user_model.dart';

class SignInGoogleButton extends StatelessWidget {
  const SignInGoogleButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<UserModel>(builder: (_, user, __) {
      return Column(
        children: <Widget>[
          ElevatedButton.icon(
              onPressed: () async {
                {
                  try {
                    await user.signInGoogle();
                    Navigator.pushNamed(context, '/');
                  } on SignInDialogCanceledException {
                    // just close the sign in dialog
                  }
                }
              },
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
                backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
              ),
              icon: SvgPicture.asset('assets/google_light.svg'),
              label: const Text('Sign in with Google'))
        ],
      );
    });
  }
}
