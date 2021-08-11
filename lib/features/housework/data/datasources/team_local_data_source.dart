import 'package:shared_preferences/shared_preferences.dart';
import 'package:sharing_housework/features/housework/domain/values/team_id.dart';

abstract class TeamLocalDataSource {
  Future<TeamId> current();
  Future<void> setCurrent(TeamId id);
}

class TeamLocalDataSourceImpl implements TeamLocalDataSource {
  @override
  Future<TeamId> current() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return TeamId(prefs.getString('currentTeamId') ?? '');
  }

  @override
  Future<void> setCurrent(TeamId id) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('currentTeamId', id.value);
  }
}
