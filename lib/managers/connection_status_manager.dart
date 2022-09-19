abstract class ConnectionStatusManager {
  void activateConnectionManager();
  Future<bool> hasInternetConnection();
  void setCheckInternetConnectionMsg(bool hasConnection);
}