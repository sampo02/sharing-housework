import 'dart:collection';
import 'package:flutter/widgets.dart';
import 'package:sharing_housework/features/housework/core/exceptions/exception.dart';
import 'package:sharing_housework/features/housework/domain/usecases/create_task_usecase.dart';
import 'package:sharing_housework/features/housework/domain/usecases/fetch_tasks_usecase.dart';

class TaskModel extends ChangeNotifier {
  final FetchTasksUsecase fetchUsecase;
  final CreateTaskUsecase createUsecase;

  TaskModel({required this.createUsecase, required this.fetchUsecase});

  var title = '';
  String? titleError;

  final List<TaskViewModel> _items = [];

  UnmodifiableListView<TaskViewModel> get items => UnmodifiableListView(_items);

  Future<void> fetch() async {
    final data = await fetchUsecase();
    _items.clear();
    _items.addAll(data.map((e) => TaskViewModel(e.title.value)));
    notifyListeners();
  }

  Future<void> create() async {
    try {
      await createUsecase(title);
    } on TaskTitleShouldNotBeEmptyException catch (_) {
      titleError = 'Task title is required';
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
