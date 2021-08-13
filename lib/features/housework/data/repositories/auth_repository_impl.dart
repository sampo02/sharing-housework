import 'package:sharing_housework/features/housework/data/datasources/auth_local_data_source.dart';
import 'package:sharing_housework/features/housework/data/datasources/auth_remote_data_source.dart';
import 'package:sharing_housework/features/housework/data/models/user_model.dart';
import 'package:sharing_housework/features/housework/domain/entities/user.dart';
import 'package:sharing_housework/features/housework/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthLocalDataSource localDataSource;
  final AuthRemoteDataSource remoteDataSource;

  AuthRepositoryImpl({
    required this.localDataSource,
    required this.remoteDataSource,
  });

  @override
  User? currentUser() {
    return localDataSource.currentUser();
  }

  @override
  Future<UserModel?> googleSignIn() {
    return remoteDataSource.signInGoogle();
  }
}
