import 'package:sharing_housework/features/housework/domain/entities/task.dart';
import 'package:sharing_housework/features/housework/domain/values/name.dart';

class TaskModel extends Task {
  TaskModel({required Name name}) : super(name: name);

  factory TaskModel.fromData(Map<String, dynamic> data) {
    return TaskModel(name: Name(data['name']));
  }

  Map<String, dynamic> toJson() {
    return {'name': name};
  }
}
