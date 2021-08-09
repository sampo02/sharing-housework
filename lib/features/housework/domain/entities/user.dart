import 'package:sharing_housework/features/housework/domain/values/team_id.dart';
import 'package:sharing_housework/features/housework/domain/values/user_id.dart';

class User {
  UserId id;
  String displayName;
  String email;
  String photoUrl;
  List<TeamId> teamIds;

  User({
    required this.id,
    required this.displayName,
    required this.email,
    required this.photoUrl,
    required this.teamIds,
  });

  void join(TeamId id) {
    if (teamIds.isEmpty) {
      teamIds = [];
    }
    teamIds.add(id);
  }

  bool notSaved(User? user) {
    return !equals(user);
  }

  bool equals(User? user) {
    if (user == null) {
      return false;
    }
    return id == user.id;
  }
}
