class HesapException implements Exception {
  final String message;

  HesapException(this.message);

  @override
  String toString() {
    return message;
  }
}
