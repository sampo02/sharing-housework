import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sharing_housework/features/housework/data/models/task_model.dart';
import 'package:sharing_housework/features/housework/domain/entities/task.dart';
import 'package:sharing_housework/features/housework/domain/values/team_id.dart';

abstract class TaskRemoteDataSource {
  Future<List<TaskModel>> list(TeamId teamId);
  Future<void> store(TeamId teamId, Task task);
}

class TaskRemoteDataSourceImpl implements TaskRemoteDataSource {
  final CollectionReference teams =
      FirebaseFirestore.instance.collection('teams');

  @override
  Future<List<TaskModel>> list(TeamId teamId) {
    return teams.doc(teamId.value).collection('tasks').get().then((values) =>
        values.docs.map((doc) => TaskModel.fromData(doc.data())).toList());
  }

  @override
  Future<void> store(TeamId teamId, Task task) {
    return teams
        .doc(teamId.value)
        .collection('tasks')
        .add({'title': task.title.value}).then((_) => (_));
  }
}
