import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';

import 'package:api/models/app/managers/connection_status.dart';

class ConnectionCheckStatusManager implements ConnectionStatus {
  static final ConnectionCheckStatusManager _connectionStatusSingleton =
      ConnectionCheckStatusManager._internal();
  ConnectionCheckStatusManager._internal();

  factory ConnectionCheckStatusManager() => _connectionStatusSingleton;

  bool _hasConnection = false;

  StreamController connectionChangeController =
      StreamController<bool>.broadcast();

  final Connectivity _connectivity = Connectivity();

  @override
  void initialize() => _connectivity.onConnectivityChanged
      .asBroadcastStream()
      .listen(getConnectionChange);

  void getConnectionChange(ConnectivityResult result) =>
      hasInternetConnection();

  @override
  Stream get connectionChangeStream => connectionChangeController.stream;

  void dispose() => connectionChangeController.close();

  @override
  Future<bool> hasInternetConnection() async {
    ConnectivityResult connectivityResult = await (Connectivity().checkConnectivity());
    // connected to wifi or mobile
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      _hasConnection = true;
    }
    // no connection
    else {
      _hasConnection = false;
    }
    connectionChangeController.add(_hasConnection);
    return _hasConnection;
  }
}
