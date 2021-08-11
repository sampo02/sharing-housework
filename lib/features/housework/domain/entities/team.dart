import 'package:sharing_housework/features/housework/domain/values/team_id.dart';
import 'package:sharing_housework/features/housework/domain/values/user_id.dart';

class NewTeam {
  List<UserId> memberIds;

  NewTeam({required this.memberIds});

  void assign(UserId memberId) {
    memberIds.add(memberId);
  }
}

class Team extends NewTeam {
  TeamId id;

  Team({required this.id, required memberIds}) : super(memberIds: memberIds);
}
