abstract class ConnectionStatusManager {
  void activateConnectionManager();
  Future<bool> hasInternetConnection();
  Stream get connectionChangeStream;
}