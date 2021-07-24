class TaskTitleShouldNotBeEmptyException implements Exception {
  final String failedValue;

  TaskTitleShouldNotBeEmptyException({required this.failedValue});
}
