import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';

import 'package:api/models/app/managers/connection_status_manager.dart';

class ConnectionCheckStatusManager implements ConnectionStatusManager {
  static final ConnectionCheckStatusManager _connectionStatusSingleton =
      ConnectionCheckStatusManager._internal();
  ConnectionCheckStatusManager._internal();

  factory ConnectionCheckStatusManager() => _connectionStatusSingleton;

  bool _hasConnection = false;

  final StreamController _connectionChangeController =
      StreamController<bool>.broadcast();

  final Connectivity _connectivity = Connectivity();

  @override
  void activateConnectionManager() => _connectivity.onConnectivityChanged
      .asBroadcastStream()
      .listen(_getConnectionChange);

  void _getConnectionChange(ConnectivityResult result) =>
      hasInternetConnection();

  @override
  Stream get connectionChangeStream => _connectionChangeController.stream;

  void dispose() => _connectionChangeController.close();

  @override
  Future<bool> hasInternetConnection() async {
    ConnectivityResult connectivityResult =
        await (Connectivity().checkConnectivity());
    // connected to wifi or mobile
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      _hasConnection = true;
    }
    // no connection
    else {
      _hasConnection = false;
    }
    _connectionChangeController.add(_hasConnection);
    return _hasConnection;
  }
}