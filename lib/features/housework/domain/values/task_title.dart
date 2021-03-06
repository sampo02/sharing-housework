import 'package:sharing_housework/features/housework/core/exceptions/exception.dart';

class TaskTitle {
  final String value;

  factory TaskTitle(String input) {
    return TaskTitle._(
      validate(input),
    );
  }

  const TaskTitle._(this.value);
}

String validate(String value) {
  if (value.isEmpty) {
    throw TaskTitleShouldNotBeEmptyException();
  }
  return value;
}
