import 'package:sharing_housework/features/housework/domain/entities/user.dart';
import 'package:sharing_housework/features/housework/domain/values/user_id.dart';

class UserModel extends User {
  UserModel(
      {required id, required displayName, required email, required photoUrl})
      : super(
            id: id, displayName: displayName, email: email, photoUrl: photoUrl);

  factory UserModel.fromData(String id, Map<String, dynamic> data) {
    return UserModel(
        id: UserId(id),
        displayName: data['displayName'],
        email: data['email'],
        photoUrl: data['photoUrl']);
  }
}
