import 'package:flutter/widgets.dart';
import 'package:sharing_housework/features/housework/domain/entities/task.dart';
import 'package:sharing_housework/features/housework/domain/usecases/create_task_usecase.dart';

class TaskModel extends ChangeNotifier {
  final CreateTaskUsecase createTaskUsecase;

  TaskModel(this.createTaskUsecase);

  Future<void> create(String name) async {
    await createTaskUsecase.call(Task(name: name));
    notifyListeners();
  }
}
