import 'package:get_it/get_it.dart';
import 'package:sharing_housework/features/housework/data/datasources/auth_local_data_source.dart';
import 'package:sharing_housework/features/housework/data/datasources/auth_remote_data_source.dart';
import 'package:sharing_housework/features/housework/data/datasources/dynamic_link_remote_data_source.dart';
import 'package:sharing_housework/features/housework/data/datasources/member_remote_data_source.dart';
import 'package:sharing_housework/features/housework/data/datasources/task_remote_data_source.dart';
import 'package:sharing_housework/features/housework/data/datasources/team_local_data_source.dart';
import 'package:sharing_housework/features/housework/data/datasources/team_remote_data_source.dart';
import 'package:sharing_housework/features/housework/data/datasources/user_remote_data_source.dart';
import 'package:sharing_housework/features/housework/data/repositories/auth_repository_impl.dart';
import 'package:sharing_housework/features/housework/data/repositories/dynamic_link_repository_impl.dart';
import 'package:sharing_housework/features/housework/data/repositories/member_repository_impl.dart';
import 'package:sharing_housework/features/housework/data/repositories/task_repository_impl.dart';
import 'package:sharing_housework/features/housework/data/repositories/team_repository_impl.dart';
import 'package:sharing_housework/features/housework/data/repositories/user_repository_impl.dart';
import 'package:sharing_housework/features/housework/domain/repositories/auth_repository.dart';
import 'package:sharing_housework/features/housework/domain/repositories/dynamic_link_repository.dart';
import 'package:sharing_housework/features/housework/domain/repositories/member_repository.dart';
import 'package:sharing_housework/features/housework/domain/repositories/task_repository.dart';
import 'package:sharing_housework/features/housework/domain/repositories/team_repository.dart';
import 'package:sharing_housework/features/housework/domain/repositories/user_repository.dart';
import 'package:sharing_housework/features/housework/domain/usecases/create_task_usecase.dart';
import 'package:sharing_housework/features/housework/domain/usecases/fetch_tasks_usecase.dart';
import 'package:sharing_housework/features/housework/domain/usecases/get_current_user_usecase.dart';
import 'package:sharing_housework/features/housework/domain/usecases/generate_dynamic_link_usecase.dart';
import 'package:sharing_housework/features/housework/domain/usecases/retrieve_dynamic_link_usecase.dart';
import 'package:sharing_housework/features/housework/domain/usecases/sign_in_google_usecase.dart';
import 'package:sharing_housework/features/housework/presentation/models/task_model.dart';
import 'package:sharing_housework/features/housework/presentation/models/team_model.dart';
import 'package:sharing_housework/features/housework/presentation/models/user_model.dart';

final instance = GetIt.instance;

Future<void> init() async {
  instance.registerFactory(
      () => TaskModel(createUsecase: instance(), fetchUsecase: instance()));
  instance.registerFactory(
      () => TeamModel(generateInvitationLinkUsecase: instance()));
  instance.registerFactory(() => UserModel(
      getCurrentUserUsecase: instance(),
      signInGoogleUsecase: instance(),
      retrieveDynamicLinkUsecase: instance()));

  instance
      .registerLazySingleton(() => FetchTasksUsecase(instance(), instance()));
  instance
      .registerLazySingleton(() => CreateTaskUsecase(instance(), instance()));
  instance.registerLazySingleton(() => GetCurrentUserUsecase(instance()));
  instance
      .registerLazySingleton(() => GenerateInvitationLinkUsecase(instance()));
  instance.registerLazySingleton(() => RetrieveDynamicLinkUsecase(instance()));
  instance.registerLazySingleton(() => SignInGoogleUsecase(
      repository: instance(),
      teamRepository: instance(),
      userRepository: instance(),
      memberRepository: instance()));

  instance.registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl(
      localDataSource: instance(), remoteDataSource: instance()));
  instance.registerLazySingleton<DynamicLinkRepository>(
      () => DynamicLinkRepositoryImpl(remoteDataSource: instance()));
  instance.registerLazySingleton<MemberRepository>(
      () => MemberRepositoryImpl(remoteDataSource: instance()));
  instance.registerLazySingleton<UserRepository>(
      () => UserRepositoryImpl(remoteDataSource: instance()));
  instance.registerLazySingleton<TeamRepository>(() => TeamRepositoryImpl(
      remoteDataSource: instance(), localDataSource: instance()));
  instance.registerLazySingleton<TaskRepository>(
      () => TaskRepositoryImpl(remoteDataSource: instance()));

  instance.registerLazySingleton<AuthLocalDataSource>(
      () => AuthLocalDataSourceImpl());
  instance.registerLazySingleton<AuthRemoteDataSource>(
      () => AuthRemoteDataSourceImpl());
  instance.registerLazySingleton<DynamicLinkRemoteDataSource>(
      () => DynamicLinkRemoteDataSourceImpl());
  instance.registerLazySingleton<MemberRemoteDataSource>(
      () => MemberRemoteDataSourceImpl());
  instance.registerLazySingleton<UserRemoteDataSource>(
      () => UserRemoteDataSourceImpl());
  instance.registerLazySingleton<TeamRemoteDataSource>(
      () => TeamRemoteDataSourceImpl());
  instance.registerLazySingleton<TeamLocalDataSource>(
      () => TeamLocalDataSourceImpl());
  instance.registerLazySingleton<TaskRemoteDataSource>(
      () => TaskRemoteDataSourceImpl());
}
