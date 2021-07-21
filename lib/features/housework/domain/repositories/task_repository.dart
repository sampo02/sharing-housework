import 'package:sharing_housework/features/housework/domain/entities/task.dart';

abstract class TaskRepository {
  Future<void> store(Task task);
}
