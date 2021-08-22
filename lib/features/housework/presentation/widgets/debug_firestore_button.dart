import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sharing_housework/features/housework/presentation/models/team_model.dart';

class DebugFirestoreButton extends StatelessWidget {
  const DebugFirestoreButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<TeamModel>(builder: (_, team, __) {
      return Column(
        children: <Widget>[
          TextButton(
            onPressed: () {
              team.generateInvitationUrl();
            },
            child: const Text('Debug'),
          ),
          SelectableText(team.invitationUrl),
        ],
      );
    });
  }
}
