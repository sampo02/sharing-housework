import 'package:sharing_housework/features/housework/domain/repositories/dynamic_link_repository.dart';

class GenerateInvitationLinkUsecase {
  final DynamicLinkRepository repository;

  GenerateInvitationLinkUsecase(this.repository);

  Future<Uri> call() {
    return repository.generateInvitation();
  }
}
