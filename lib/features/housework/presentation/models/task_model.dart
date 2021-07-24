import 'dart:collection';
import 'package:flutter/widgets.dart';
import 'package:sharing_housework/features/housework/core/exceptions/exception.dart';
import 'package:sharing_housework/features/housework/domain/usecases/create_task_usecase.dart';
import 'package:sharing_housework/features/housework/domain/usecases/fetch_tasks_usecase.dart';

class TaskModel extends ChangeNotifier {
  final FetchTasksUsecase fetchTasksUsecase;
  final CreateTaskUsecase createTaskUsecase;

  var title = '';
  String? titleError;

  final List<TaskViewModel> _items = [];

  UnmodifiableListView<TaskViewModel> get items => UnmodifiableListView(_items);

  TaskModel(this.fetchTasksUsecase, this.createTaskUsecase);

  Future<void> fetch() async {
    final data = await fetchTasksUsecase();
    _items.clear();
    _items.addAll(data.map((e) => TaskViewModel(e.title.toString())));
    notifyListeners();
  }

  Future<void> create() async {
    try {
      await createTaskUsecase(title);
    } catch (e) {
      if (e is TaskTitleShouldNotBeEmptyException) {
        titleError = 'Task title is required';
      }
    }
    await fetch();
    notifyListeners();
  }

  void changeTitle(String value) {
    title = value;
    titleError = validateTitle() ? null : 'Please input task title';
    notifyListeners();
  }

  bool validateTitle() {
    return title.isNotEmpty;
  }
}

class TaskViewModel {
  final String title;

  TaskViewModel(this.title);
}
