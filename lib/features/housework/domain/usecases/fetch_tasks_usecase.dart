import 'package:sharing_housework/features/housework/domain/entities/task.dart';
import 'package:sharing_housework/features/housework/domain/repositories/task_repository.dart';

class FetchTasksUsecase {
  final TaskRepository repository;

  FetchTasksUsecase(this.repository);

  Future<List<Task>> call() async {
    return repository.list();
  }
}
