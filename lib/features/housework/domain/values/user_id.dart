import 'package:sharing_housework/features/housework/core/exceptions/exception.dart';

class UserId {
  final String value;

  factory UserId(String input) {
    return UserId._(
      validate(input),
    );
  }

  const UserId._(this.value);

  bool equals(UserId id) {
    return this == id;
  }
}

String validate(String value) {
  if (value.isEmpty) {
    throw UserIdShouldNotBeEmptyException();
  }

  return value;
}
