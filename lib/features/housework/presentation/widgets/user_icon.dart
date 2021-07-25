import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sharing_housework/features/housework/presentation/models/user_model.dart';

class UserIcon extends StatelessWidget {
  const UserIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<UserModel>(builder: (_, user, __) {
      return IconButton(
          onPressed: () => {},
          icon: user.photoUrl.isEmpty
              ? const Icon(Icons.account_circle)
              : CircleAvatar(
                  radius: 16,
                  backgroundImage: NetworkImage(user.photoUrl),
                ));
    });
  }
}
