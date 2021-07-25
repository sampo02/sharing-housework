import 'package:sharing_housework/features/housework/domain/entities/user.dart';

abstract class AuthRepository {
  Future<User> googleSignIn();
}
