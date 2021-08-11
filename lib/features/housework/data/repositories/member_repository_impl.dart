import 'package:sharing_housework/features/housework/data/datasources/member_remote_data_source.dart';
import 'package:sharing_housework/features/housework/domain/entities/member.dart';
import 'package:sharing_housework/features/housework/domain/repositories/member_repository.dart';
import 'package:sharing_housework/features/housework/domain/values/team_id.dart';

class MemberRepositoryImpl implements MemberRepository {
  final MemberRemoteDataSource remoteDataSource;

  MemberRepositoryImpl({
    required this.remoteDataSource,
  });

  @override
  Future<List<Member>> list(TeamId teamId) {
    return remoteDataSource.list(teamId);
  }

  @override
  Future<void> store(TeamId teamId, Member member) {
    return remoteDataSource.store(teamId, member);
  }
}
