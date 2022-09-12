abstract class ConnectionStatus {
  void initialize();
  Future<bool> hasInternetConnection();
  Stream get connectionChangeStream;
}