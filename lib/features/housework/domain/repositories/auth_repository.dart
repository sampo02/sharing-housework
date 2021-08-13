import 'package:sharing_housework/features/housework/domain/entities/user.dart';

abstract class AuthRepository {
  User? currentUser();
  Future<User?> googleSignIn();
}
