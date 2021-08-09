import 'package:sharing_housework/features/housework/domain/entities/team_user.dart';

class TeamUserModel extends TeamUser {
  TeamUserModel({required id, required displayName, required photoUrl})
      : super(id: id, displayName: displayName, photoUrl: photoUrl);

  Map<String, Object?> toJson() =>
      {'displayName': displayName, 'photoUrl': photoUrl};
}
