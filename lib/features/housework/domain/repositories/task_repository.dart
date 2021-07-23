import 'package:sharing_housework/features/housework/data/models/task_model.dart';
import 'package:sharing_housework/features/housework/domain/entities/task.dart';

abstract class TaskRepository {
  Future<List<TaskModel>> list();
  Future<void> store(Task task);
}
