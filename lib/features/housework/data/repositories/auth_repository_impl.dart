import 'package:sharing_housework/features/housework/data/datasources/auth_remote_data_source.dart';
import 'package:sharing_housework/features/housework/data/models/user_model.dart';
import 'package:sharing_housework/features/housework/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;

  AuthRepositoryImpl({
    required this.remoteDataSource,
  });

  @override
  Future<UserModel> googleSignIn() {
    return remoteDataSource.signInGoogle();
  }
}
