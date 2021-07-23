import 'package:sharing_housework/features/housework/domain/entities/task.dart';

class TaskModel extends Task {
  TaskModel({required String name}) : super(name: name);

  factory TaskModel.fromData(Map<String, dynamic> data) {
    return TaskModel(name: data['name']);
  }

  Map<String, dynamic> toJson() {
    return {'name': name};
  }
}
