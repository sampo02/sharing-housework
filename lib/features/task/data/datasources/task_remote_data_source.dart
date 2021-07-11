abstract class TaskRemoteDataSource {
  Future<void> storeTask();
}

class TaskRemoteDataSourceImpl implements TaskRemoteDataSource {

  @override
  Future<void> storeTask() {
    throw UnimplementedError();
  }
}