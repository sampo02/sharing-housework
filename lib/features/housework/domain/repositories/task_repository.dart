import 'package:sharing_housework/features/housework/domain/entities/task.dart';

abstract class TaskRepository {
  Future<List<Task>> list();
  Future<void> store(Task task);
}
