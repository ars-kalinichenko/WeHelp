class ServerError implements Exception {
  String cause;
  ServerError(this.cause);
}

class InternetError implements Exception {
  String cause;
  InternetError(this.cause);
}