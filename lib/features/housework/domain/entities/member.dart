import 'package:sharing_housework/features/housework/domain/values/user_id.dart';

class Member {
  UserId id;
  String displayName;
  String photoUrl;

  Member({
    required this.id,
    required this.displayName,
    required this.photoUrl,
  });
}
