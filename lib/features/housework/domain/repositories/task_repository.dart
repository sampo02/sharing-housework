import 'package:sharing_housework/features/housework/domain/entities/task.dart';
import 'package:sharing_housework/features/housework/domain/values/team_id.dart';

abstract class TaskRepository {
  Future<List<Task>> list(TeamId teamId);
  Future<void> store(TeamId teamId, Task task);
}
