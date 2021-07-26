import 'package:sharing_housework/features/housework/data/datasources/user_remote_data_source.dart';
import 'package:sharing_housework/features/housework/domain/entities/user.dart';
import 'package:sharing_housework/features/housework/domain/repositories/user_repository.dart';
import 'package:sharing_housework/features/housework/domain/values/user_id.dart';

class UserRepositoryImpl implements UserRepository {
  final UserRemoteDataSource remoteDataSource;

  UserRepositoryImpl({
    required this.remoteDataSource,
  });

  @override
  Future<User?> findBy(UserId id) {
    return remoteDataSource.findBy(id);
  }

  @override
  Future<void> store(User user) {
    return remoteDataSource.store(user);
  }
}
