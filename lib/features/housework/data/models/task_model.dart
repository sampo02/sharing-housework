import 'package:sharing_housework/features/housework/domain/entities/task.dart';

class TaskModel extends Task {
  TaskModel({
    required String name
  }) : super(name: name);

  factory TaskModel.fromJson(Map<String, dynamic> json) {
    return TaskModel(
      name: json['name']
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name
    };
  }
}