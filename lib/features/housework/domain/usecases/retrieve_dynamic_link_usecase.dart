import 'package:sharing_housework/features/housework/domain/repositories/dynamic_link_repository.dart';

class RetrieveDynamicLinkUsecase {
  final DynamicLinkRepository repository;

  RetrieveDynamicLinkUsecase(this.repository);

  Future<Uri?> call() {
    return repository.retrieve();
  }
}
