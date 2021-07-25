import 'package:get_it/get_it.dart';
import 'package:sharing_housework/features/housework/data/datasources/auth_remote_data_source.dart';
import 'package:sharing_housework/features/housework/data/datasources/task_remote_data_source.dart';
import 'package:sharing_housework/features/housework/data/repositories/auth_repository_impl.dart';
import 'package:sharing_housework/features/housework/data/repositories/task_repository_impl.dart';
import 'package:sharing_housework/features/housework/domain/repositories/auth_repository.dart';
import 'package:sharing_housework/features/housework/domain/repositories/task_repository.dart';
import 'package:sharing_housework/features/housework/domain/usecases/create_task_usecase.dart';
import 'package:sharing_housework/features/housework/domain/usecases/fetch_tasks_usecase.dart';
import 'package:sharing_housework/features/housework/domain/usecases/sign_in_google_usecase.dart';
import 'package:sharing_housework/features/housework/presentation/models/task_model.dart';
import 'package:sharing_housework/features/housework/presentation/models/user_model.dart';

final instance = GetIt.instance;

Future<void> init() async {
  instance.registerFactory(
      () => TaskModel(createUsecase: instance(), fetchUsecase: instance()));
  instance.registerFactory(() => UserModel(signInGoogleUsecase: instance()));

  instance.registerLazySingleton(() => FetchTasksUsecase(instance()));
  instance.registerLazySingleton(() => CreateTaskUsecase(instance()));
  instance.registerLazySingleton(() => SignInGoogleUsecase(instance()));

  instance.registerLazySingleton<AuthRepository>(
      () => AuthRepositoryImpl(remoteDataSource: instance()));
  instance.registerLazySingleton<TaskRepository>(
      () => TaskRepositoryImpl(remoteDataSource: instance()));

  instance.registerLazySingleton<AuthRemoteDataSource>(
      () => AuthRemoteDataSourceImpl());
  instance.registerLazySingleton<TaskRemoteDataSource>(
      () => TaskRemoteDataSourceImpl());
}
