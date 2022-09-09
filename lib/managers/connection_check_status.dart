import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:api/models/app/managers/connection_status.dart';

class ConnectionCheckStatus implements ConnectionStatus {
  static final ConnectionCheckStatus _connectionStatusSingleton =
      ConnectionCheckStatus._internal();
  ConnectionCheckStatus._internal();

  factory ConnectionCheckStatus() {
    return _connectionStatusSingleton;
  }

  bool hasConnection = false;

  StreamController connectionChangeController =
      StreamController<bool>.broadcast();

  final Connectivity _connectivity = Connectivity();

  @override
  void initialize() {
    _connectivity.onConnectivityChanged
        .asBroadcastStream()
        .listen(getConnectionChange);
  }

  void getConnectionChange(ConnectivityResult result) {
    hasInternetConnection();
  }

  @override
  Stream get connectionChange => connectionChangeController.stream;

  void dispose() {
    connectionChangeController.close();
  }

  @override
  Future<bool> hasInternetConnection() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    // connected to wifi or mobile
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      hasConnection = true;
    }
    // no connection
    else {
      hasConnection = false;
    }
    connectionChangeController.add(hasConnection);
    return hasConnection;
  }
}