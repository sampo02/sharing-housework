import 'package:sharing_housework/features/housework/domain/entities/user.dart';

class UserModel extends User {
  UserModel({required displayName, required email, required photoUrl})
      : super(displayName: displayName, email: email, photoUrl: photoUrl);

  factory UserModel.fromData(displayName, email, photoUrl) {
    return UserModel(
        displayName: displayName, email: email, photoUrl: photoUrl);
  }
}
