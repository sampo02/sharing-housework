import 'package:firebase_auth/firebase_auth.dart';
import 'package:sharing_housework/features/housework/data/models/user_model.dart';
import 'package:sharing_housework/features/housework/domain/values/user_id.dart';

abstract class AuthLocalDataSource {
  UserModel? currentUser();
}

class AuthLocalDataSourceImpl implements AuthLocalDataSource {
  @override
  UserModel? currentUser() {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      return null;
    }
    return UserModel(
        id: UserId(user.uid),
        displayName: user.displayName,
        email: user.email,
        photoUrl: user.photoURL,
        teamIds: List.empty());
  }
}
