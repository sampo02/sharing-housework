import 'package:sharing_housework/features/housework/domain/entities/member.dart';
import 'package:sharing_housework/features/housework/domain/values/team_id.dart';

abstract class MemberRepository {
  Future<List<Member>> list(TeamId teamId);
  Future<void> store(TeamId teamId, Member member);
}
