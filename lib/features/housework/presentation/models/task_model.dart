import 'dart:collection';
import 'package:flutter/widgets.dart';
import 'package:sharing_housework/features/housework/domain/entities/task.dart';
import 'package:sharing_housework/features/housework/domain/usecases/create_task_usecase.dart';
import 'package:sharing_housework/features/housework/domain/usecases/fetch_tasks_usecase.dart';

class TaskModel extends ChangeNotifier {
  final FetchTasksUsecase fetchTasksUsecase;
  final CreateTaskUsecase createTaskUsecase;

  final List<TaskViewModel> _items = [];

  UnmodifiableListView<TaskViewModel> get items => UnmodifiableListView(_items);

  TaskModel(this.fetchTasksUsecase, this.createTaskUsecase);

  Future<void> fetch() async {
    final data = await fetchTasksUsecase();
    _items.clear();
    _items.addAll(data.map((e) => TaskViewModel(e.name)));
    notifyListeners();
  }

  Future<void> create(String name) async {
    await createTaskUsecase(Task(name: name));
    await fetch();
    notifyListeners();
  }
}

class TaskViewModel {
  String name;

  TaskViewModel(this.name);
}
