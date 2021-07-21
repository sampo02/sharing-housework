import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sharing_housework/features/housework/domain/entities/task.dart';

abstract class TaskRemoteDataSource {
  Future<void> storeTask(Task task);
}

class TaskRemoteDataSourceImpl implements TaskRemoteDataSource {
  @override
  Future<void> storeTask(Task task) {
    CollectionReference tasks = FirebaseFirestore.instance.collection('tasks');
    return tasks
        .add({'name': task.name})
        .then((_) => (_))
        .catchError((_) => (_));
  }
}
