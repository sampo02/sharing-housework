import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sharing_housework/features/housework/data/models/task_model.dart';
import 'package:sharing_housework/features/housework/domain/entities/task.dart';

abstract class TaskRemoteDataSource {
  Future<List<TaskModel>> listTasks();
  Future<void> storeTask(Task task);
}

class TaskRemoteDataSourceImpl implements TaskRemoteDataSource {
  final CollectionReference tasks =
      FirebaseFirestore.instance.collection('tasks');

  @override
  Future<List<TaskModel>> listTasks() {
    return tasks.get().then((values) => values.docs
        .map((doc) => TaskModel.fromData(doc.data() as Map<String, dynamic>))
        .toList());
  }

  @override
  Future<void> storeTask(Task task) {
    return tasks
        .add({'name': task.name.toString()})
        .then((_) => (_))
        .catchError((_) => (_));
  }
}
