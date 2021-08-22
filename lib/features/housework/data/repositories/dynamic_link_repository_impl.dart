import 'package:sharing_housework/features/housework/data/datasources/dynamic_link_remote_data_source.dart';
import 'package:sharing_housework/features/housework/domain/repositories/dynamic_link_repository.dart';

class DynamicLinkRepositoryImpl implements DynamicLinkRepository {
  final DynamicLinkRemoteDataSource remoteDataSource;

  DynamicLinkRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Uri> generateInvitation() {
    return remoteDataSource.generateInvitation();
  }

  @override
  Future<Uri?> retrieve() async {
    return await remoteDataSource.retrieve();
  }
}
