import 'package:sharing_housework/features/housework/data/datasources/task_remote_data_source.dart';
import 'package:sharing_housework/features/housework/domain/entities/task.dart';
import 'package:sharing_housework/features/housework/domain/repositories/task_repository.dart';

class TaskRepositoryImpl implements TaskRepository {
  final TaskRemoteDataSource remoteDataSource;

  TaskRepositoryImpl({
    required this.remoteDataSource,
  });

  @override
  Future<void> store(Task task) {
    return remoteDataSource.storeTask(task);
  }
}
