import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';

import 'package:globo_fitness/managers/connectionManager/connection_manager.dart';

import 'package:globo_fitness/shared/overlay_notification.dart';

class ConnectionManagerImpl implements ConnectionManager {
  static final ConnectionManagerImpl _connectionManagerSingleton =
      ConnectionManagerImpl._internal();
  ConnectionManagerImpl._internal();

  factory ConnectionManagerImpl() => _connectionManagerSingleton;

  bool _hasConnection = false;

  final StreamController _connectionChangeController =
      StreamController<bool>.broadcast();

  final Connectivity _connectivity = Connectivity();

  @override
  void activateConnectionManager() => _connectivity.onConnectivityChanged
      .asBroadcastStream()
      .listen(_onDataChangeHandler);

  void _onDataChangeHandler(ConnectivityResult connectivityResult) {
    _hasConnection = (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi);

    _connectionChangeController.add(_hasConnection);
    showPopupNewConnectionStatus(isSuccess: _hasConnection);
  }

  void dispose() => _connectionChangeController.close();

  @override
  bool hasInternetConnection() => _hasConnection;
}