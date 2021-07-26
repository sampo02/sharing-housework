import 'package:sharing_housework/features/housework/domain/entities/user.dart';
import 'package:sharing_housework/features/housework/domain/repositories/auth_repository.dart';
import 'package:sharing_housework/features/housework/domain/repositories/user_repository.dart';

class SignInGoogleUsecase {
  final AuthRepository repository;
  final UserRepository userRepository;

  SignInGoogleUsecase({required this.repository, required this.userRepository});

  Future<User> call() async {
    final signedInUser = await repository.googleSignIn();

    final maybeStoredUser = await userRepository.findBy(signedInUser.id);
    if (!signedInUser.equals(maybeStoredUser)) {
      await userRepository.store(signedInUser);
    }

    return signedInUser;
  }
}
