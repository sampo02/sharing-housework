import 'package:sharing_housework/features/housework/core/exceptions/exception.dart';
import 'package:sharing_housework/features/housework/domain/entities/member.dart';
import 'package:sharing_housework/features/housework/domain/entities/team.dart';
import 'package:sharing_housework/features/housework/domain/entities/user.dart';
import 'package:sharing_housework/features/housework/domain/repositories/auth_repository.dart';
import 'package:sharing_housework/features/housework/domain/repositories/member_repository.dart';
import 'package:sharing_housework/features/housework/domain/repositories/team_repository.dart';
import 'package:sharing_housework/features/housework/domain/repositories/user_repository.dart';

class SignInGoogleUsecase {
  final AuthRepository repository;
  final TeamRepository teamRepository;
  final UserRepository userRepository;
  final MemberRepository memberRepository;

  SignInGoogleUsecase({
    required this.repository,
    required this.teamRepository,
    required this.userRepository,
    required this.memberRepository,
  });

  Future<User> call() async {
    final newUser = await repository.googleSignIn();
    if (newUser == null) {
      throw GoogleSignInShouldReturnUserException();
    }

    final maybeStoredUser = await userRepository.findBy(newUser.id);
    if (newUser.notSaved(maybeStoredUser)) {
      final newTeam = NewTeam(memberIds: []);
      newTeam.assign(newUser.id);

      final newTeamId = await teamRepository.store(newTeam);
      newUser.join(newTeamId);
      await userRepository.store(newUser);

      await memberRepository.store(
          newTeamId,
          Member(
              id: newUser.id,
              displayName: newUser.displayName,
              photoUrl: newUser.photoUrl));

      await teamRepository.setCurrent(newTeamId);
    } else {
      final teamId = maybeStoredUser!.teamIds.first;
      await teamRepository.setCurrent(teamId);
    }

    return newUser;
  }
}
