import 'package:sharing_housework/features/housework/data/datasources/task_remote_data_source.dart';
import 'package:sharing_housework/features/housework/domain/entities/task.dart';
import 'package:sharing_housework/features/housework/domain/repositories/task_repository.dart';
import 'package:sharing_housework/features/housework/domain/values/team_id.dart';

class TaskRepositoryImpl implements TaskRepository {
  final TaskRemoteDataSource remoteDataSource;

  TaskRepositoryImpl({
    required this.remoteDataSource,
  });

  @override
  Future<List<Task>> list(TeamId teamId) {
    return remoteDataSource.list(teamId);
  }

  @override
  Future<void> store(TeamId teamId, Task task) {
    return remoteDataSource.store(teamId, task);
  }
}
