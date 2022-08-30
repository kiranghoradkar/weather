// Failure classes

class ServerFailure implements Exception {
  final String message;

  ServerFailure({required this.message});

  @override
  String toString() {
    return message;
  }
}

class NoInternet implements Exception {
  final String message;

  NoInternet({required this.message});

  @override
  String toString() {
    return message;
  }
}
