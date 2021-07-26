import 'package:sharing_housework/features/housework/domain/values/user_id.dart';

class User {
  UserId id;
  String displayName;
  String email;
  String photoUrl;

  User(
      {required this.id,
      required this.displayName,
      required this.email,
      required this.photoUrl});

  bool equals(User? user) {
    if (user == null) {
      return false;
    }
    return id == user.id;
  }
}
