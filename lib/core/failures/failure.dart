class Failure {}

class FailureWithDescription extends Failure {
  final String description;

  FailureWithDescription({
    required this.description,
  });

  @override
  String toString() => description;
}

class DataBaseFailure extends FailureWithDescription {
  DataBaseFailure({required super.description});
}

class UseCaseFailure extends Failure {}
