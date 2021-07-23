import 'package:flutter/widgets.dart';
import 'package:sharing_housework/features/housework/domain/entities/task.dart';
import 'package:sharing_housework/features/housework/domain/usecases/create_task_usecase.dart';
import 'package:sharing_housework/features/housework/domain/usecases/fetch_tasks_usecase.dart';

class TaskModel extends ChangeNotifier {
  final FetchTasksUsecase fetchTasksUsecase;
  final CreateTaskUsecase createTaskUsecase;

  TaskModel(this.fetchTasksUsecase, this.createTaskUsecase);

  Future<void> fetch() async {
    await fetchTasksUsecase();
    notifyListeners();
  }

  Future<void> create(String name) async {
    await createTaskUsecase(Task(name: name));
    notifyListeners();
  }
}
