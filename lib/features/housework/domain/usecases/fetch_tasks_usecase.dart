import 'package:sharing_housework/features/housework/data/models/task_model.dart';
import 'package:sharing_housework/features/housework/domain/repositories/task_repository.dart';

class FetchTasksUsecase {
  final TaskRepository repository;

  FetchTasksUsecase(this.repository);

  Future<List<TaskModel>> call() async {
    return repository.list();
  }
}
