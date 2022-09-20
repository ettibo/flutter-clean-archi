import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';

import 'package:globo_fitness/managers/connectionManager/connection_manager.dart';

import 'package:globo_fitness/shared/toast_utils.dart';

class ConnectionCheckStatusManagerImpl implements ConnectionStatusManager {
  static final ConnectionCheckStatusManagerImpl _connectionStatusSingleton =
      ConnectionCheckStatusManagerImpl._internal();
  ConnectionCheckStatusManagerImpl._internal();

  factory ConnectionCheckStatusManagerImpl() => _connectionStatusSingleton;

  bool _hasConnection = false;

  final StreamController _connectionChangeController =
      StreamController<bool>.broadcast();

  final Connectivity _connectivity = Connectivity();

  @override
  void activateConnectionManager() => _connectivity.onConnectivityChanged
      .asBroadcastStream()
      .listen(_getConnectionChange);

  void _getConnectionChange(ConnectivityResult result) {
    hasInternetConnection();
  }

  void dispose() => _connectionChangeController.close();

  @override
  Future<bool> hasInternetConnection() async {
    ConnectivityResult connectivityResult =
        await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      _hasConnection = true;
    }
    // no connection
    else {
      _hasConnection = false;
    }
    _connectionChangeController.add(_hasConnection);
    showAlertCheckInternetConnection(_hasConnection);
    return _hasConnection;
  }
}