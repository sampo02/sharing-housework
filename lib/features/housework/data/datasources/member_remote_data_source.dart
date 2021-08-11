import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sharing_housework/features/housework/data/models/member_model.dart';
import 'package:sharing_housework/features/housework/domain/entities/member.dart';
import 'package:sharing_housework/features/housework/domain/values/team_id.dart';

abstract class MemberRemoteDataSource {
  Future<List<MemberModel>> list(TeamId teamId);
  Future<void> store(TeamId teamId, Member member);
}

class MemberRemoteDataSourceImpl implements MemberRemoteDataSource {
  final CollectionReference teams =
      FirebaseFirestore.instance.collection('teams');

  @override
  Future<List<MemberModel>> list(TeamId teamId) {
    return teams.doc(teamId.value).collection('members').get().then((values) =>
        values.docs.map((doc) => MemberModel.fromData(doc.data())).toList());
  }

  @override
  Future<void> store(TeamId teamId, Member member) {
    return teams
        .doc(teamId.value)
        .collection('members')
        .doc(member.id.value)
        .set({
      'displayName': member.displayName,
      'photoUrl': member.photoUrl
    }).then((_) => (_));
  }
}
