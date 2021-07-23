class Name {
  final String value;

  factory Name(String input) {
    return Name._(
      validate(input),
    );
  }

  const Name._(this.value);

  @override
  String toString() => value.toString();
}

String validate(String input) {
  if (input.length <= 200) {
    return input;
  } else {
    throw InvalidNameException(failedValue: input);
  }
}

class InvalidNameException implements Exception {
  final String failedValue;

  InvalidNameException({required this.failedValue});
}
