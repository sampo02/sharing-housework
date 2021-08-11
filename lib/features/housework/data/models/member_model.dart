import 'package:sharing_housework/features/housework/domain/entities/member.dart';
import 'package:sharing_housework/features/housework/domain/values/user_id.dart';

class MemberModel extends Member {
  MemberModel(
      {required UserId id,
      required String displayName,
      required String photoUrl})
      : super(id: id, displayName: displayName, photoUrl: photoUrl);

  factory MemberModel.fromData(Map<String, dynamic> data) {
    return MemberModel(
        id: UserId(data['id']),
        displayName: data['displayName'],
        photoUrl: data['photoUrl']);
  }
}
