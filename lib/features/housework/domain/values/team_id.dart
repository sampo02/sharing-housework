import 'package:sharing_housework/features/housework/core/exceptions/exception.dart';

class TeamId {
  final String value;

  factory TeamId(String value) {
    return TeamId._(
      validate(value),
    );
  }

  const TeamId._(this.value);

  bool equals(TeamId id) {
    return this == id;
  }
}

String validate(String value) {
  if (value.isEmpty) {
    throw TeamIdShouldNotBeEmptyException();
  }

  return value;
}
