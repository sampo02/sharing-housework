import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sharing_housework/features/housework/data/models/team_model.dart';
import 'package:sharing_housework/features/housework/data/models/team_user_model.dart';
import 'package:sharing_housework/features/housework/domain/entities/team.dart';
import 'package:sharing_housework/features/housework/domain/values/team_id.dart';

abstract class TeamRemoteDataSource {
  Future<TeamId> store(NewTeam team);
}

class TeamRemoteDataSourceImpl implements TeamRemoteDataSource {
  final CollectionReference teams =
      FirebaseFirestore.instance.collection('teams');
  final teamsRef = FirebaseFirestore.instance.collection('teams').withConverter(
      fromFirestore: (snapshot, _) => TeamModel.fromJson(snapshot.data()!),
      toFirestore: (team, _) => team.toJson());

  @override
  Future<TeamId> store(NewTeam team) async {
    final doc = await teamsRef.add(TeamModel(
        tasks: [],
        memberIds: team.members.map((m) => 'users/${m.id.value}').toList(),
        members: team.members
            .map((m) => TeamUserModel(
                  id: m.id,
                  displayName: m.displayName,
                  photoUrl: m.photoUrl,
                ))
            .toList()));
    return TeamId(doc.id);
  }
}
