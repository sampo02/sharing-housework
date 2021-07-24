import 'package:sharing_housework/features/housework/core/exceptions/exception.dart';

class TaskTitle {
  final String value;

  factory TaskTitle(String input) {
    return TaskTitle._(
      validate(input),
    );
  }

  const TaskTitle._(this.value);

  @override
  String toString() => value.toString();
}

String validate(String input) {
  if (input.isEmpty) {
    throw TaskTitleShouldNotBeEmptyException(failedValue: input);
  }
  return input;
}
