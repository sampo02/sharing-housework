import 'package:sharing_housework/features/housework/domain/entities/user.dart';
import 'package:sharing_housework/features/housework/domain/values/user_id.dart';

abstract class UserRepository {
  Future<User?> findBy(UserId id);
  Future<void> store(User user);
}
