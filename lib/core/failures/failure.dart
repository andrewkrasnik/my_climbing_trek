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

class NoSQLBaseFailure extends FailureWithDescription {
  NoSQLBaseFailure({required super.description});
}

class DataConvertionFailure extends FailureWithDescription {
  DataConvertionFailure({required super.description});
}

class LoginFailure extends FailureWithDescription {
  LoginFailure({required super.description});
}

class LogoutFailure extends FailureWithDescription {
  LogoutFailure({required super.description});
}

class RemoteServerFailure extends FailureWithDescription {
  RemoteServerFailure({required super.description});
}

class UseCaseFailure extends Failure {}

class DataConversionFailure extends FailureWithDescription {
  DataConversionFailure({required super.description});
}
