import 'package:sharing_housework/features/housework/domain/entities/task.dart';
import 'package:sharing_housework/features/housework/domain/values/task_title.dart';

class TaskModel extends Task {
  TaskModel({required TaskTitle title}) : super(title: title);

  factory TaskModel.fromData(Map<String, dynamic> data) {
    return TaskModel(title: TaskTitle(data['title'] ?? ''));
  }
}
