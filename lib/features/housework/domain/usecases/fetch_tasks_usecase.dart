import 'package:sharing_housework/features/housework/domain/entities/task.dart';
import 'package:sharing_housework/features/housework/domain/repositories/task_repository.dart';
import 'package:sharing_housework/features/housework/domain/repositories/team_repository.dart';

class FetchTasksUsecase {
  final TaskRepository repository;
  final TeamRepository teamRepository;

  FetchTasksUsecase(this.repository, this.teamRepository);

  Future<List<Task>> call() async {
    final teamId = await teamRepository.current();
    return repository.list(teamId);
  }
}
