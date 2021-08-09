import 'package:sharing_housework/features/housework/domain/entities/team.dart';
import 'package:sharing_housework/features/housework/domain/values/team_id.dart';

abstract class TeamRepository {
  Future<TeamId> store(NewTeam team);
}
