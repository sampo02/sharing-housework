import 'package:sharing_housework/features/housework/data/datasources/team_remote_data_source.dart';
import 'package:sharing_housework/features/housework/domain/entities/team.dart';
import 'package:sharing_housework/features/housework/domain/repositories/team_repository.dart';
import 'package:sharing_housework/features/housework/domain/values/team_id.dart';

class TeamRepositoryImpl implements TeamRepository {
  final TeamRemoteDataSource remoteDataSource;

  TeamRepositoryImpl({
    required this.remoteDataSource,
  });

  @override
  Future<TeamId> store(NewTeam team) {
    return remoteDataSource.store(team);
  }
}
