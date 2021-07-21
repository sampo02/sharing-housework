import 'package:sharing_housework/features/housework/domain/entities/task.dart';
import 'package:sharing_housework/features/housework/domain/repositories/task_repository.dart';

class CreateTaskUsecase {
  final TaskRepository repository;

  CreateTaskUsecase(this.repository);

  Future<void> call(Task task) async {
    return repository.store(task);
  }
}
