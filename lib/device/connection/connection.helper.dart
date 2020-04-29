import 'package:connectivity/connectivity.dart';

class ConnectionHelper {
  static ConnectivityResult _connectivityResult;

  static Future _connect() async {
    _connectivityResult = await Connectivity().checkConnectivity();
  }

  static Future<bool> hasConnection() async {
    await _connect();
    if (_connectivityResult == ConnectivityResult.mobile) return true;
    if (_connectivityResult == ConnectivityResult.wifi) return true;
    return false; 
  }

  static Stream<ConnectivityResult> connectionListener() {
    return Connectivity().onConnectivityChanged;
  }
}