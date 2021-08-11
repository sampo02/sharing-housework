import 'package:sharing_housework/features/housework/domain/entities/task.dart';
import 'package:sharing_housework/features/housework/domain/repositories/task_repository.dart';
import 'package:sharing_housework/features/housework/domain/repositories/team_repository.dart';
import 'package:sharing_housework/features/housework/domain/values/task_title.dart';

class CreateTaskUsecase {
  final TaskRepository repository;
  final TeamRepository teamRepository;

  CreateTaskUsecase(this.repository, this.teamRepository);

  Future<void> call(String title) async {
    final teamId = await teamRepository.current();
    return repository.store(teamId, Task(title: TaskTitle(title)));
  }
}
