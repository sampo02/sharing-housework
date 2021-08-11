import 'package:sharing_housework/features/housework/domain/entities/team.dart';
import 'package:sharing_housework/features/housework/domain/entities/team_user.dart';
import 'package:sharing_housework/features/housework/domain/entities/user.dart';
import 'package:sharing_housework/features/housework/domain/repositories/auth_repository.dart';
import 'package:sharing_housework/features/housework/domain/repositories/team_repository.dart';
import 'package:sharing_housework/features/housework/domain/repositories/user_repository.dart';

class SignInGoogleUsecase {
  final AuthRepository repository;
  final TeamRepository teamRepository;
  final UserRepository userRepository;

  SignInGoogleUsecase(
      {required this.repository,
      required this.teamRepository,
      required this.userRepository});

  Future<User> call() async {
    final newUser = await repository.googleSignIn();

    final maybeStoredUser = await userRepository.findBy(newUser.id);
    if (newUser.notSaved(maybeStoredUser)) {
      final newTeam = NewTeam(tasks: [], members: []);
      newTeam.assign(TeamUser(
          id: newUser.id,
          displayName: newUser.displayName,
          photoUrl: newUser.photoUrl));

      final newTeamId = await teamRepository.store(newTeam);
      newUser.join(newTeamId);
      await userRepository.store(newUser);

      await teamRepository.setCurrent(newTeamId);
    }

    return newUser;
  }
}
