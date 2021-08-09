import 'package:sharing_housework/features/housework/domain/values/user_id.dart';

class TeamUser {
  UserId id;
  String displayName;
  String photoUrl;

  TeamUser({
    required this.id,
    required this.displayName,
    required this.photoUrl,
  });
}
