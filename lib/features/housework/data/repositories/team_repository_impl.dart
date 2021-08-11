import 'package:sharing_housework/features/housework/data/datasources/team_local_data_source.dart';
import 'package:sharing_housework/features/housework/data/datasources/team_remote_data_source.dart';
import 'package:sharing_housework/features/housework/domain/entities/team.dart';
import 'package:sharing_housework/features/housework/domain/repositories/team_repository.dart';
import 'package:sharing_housework/features/housework/domain/values/team_id.dart';

class TeamRepositoryImpl implements TeamRepository {
  final TeamRemoteDataSource remoteDataSource;
  final TeamLocalDataSource localDataSource;

  TeamRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
  });

  @override
  Future<TeamId> store(NewTeam team) {
    return remoteDataSource.store(team);
  }

  @override
  Future<TeamId> current() {
    return localDataSource.current();
  }

  @override
  Future<void> setCurrent(TeamId id) {
    return localDataSource.setCurrent(id);
  }
}
