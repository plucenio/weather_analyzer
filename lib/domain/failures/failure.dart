class Failure {
  final String message;

  Failure({required this.message});

  @override
  String toString() => message;
}

class ServerFailure extends Failure {
  ServerFailure({required super.message});
}

class UnprocessableEntityFailure extends Failure {
  UnprocessableEntityFailure({required super.message});
}
