import 'package:sharing_housework/features/task/domain/repositories/task_repository.dart';

class CreateTaskUsecase {
  final TaskRepository repository;

  CreateTaskUsecase(this.repository);

  void call() {
    repository.store();
  }
}