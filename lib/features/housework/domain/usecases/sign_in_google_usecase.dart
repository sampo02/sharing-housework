import 'package:sharing_housework/features/housework/domain/entities/user.dart';
import 'package:sharing_housework/features/housework/domain/repositories/auth_repository.dart';

class SignInGoogleUsecase {
  final AuthRepository repository;

  SignInGoogleUsecase(this.repository);

  Future<User> call() async {
    return repository.googleSignIn();
  }
}
