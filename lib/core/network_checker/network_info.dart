import 'package:data_connection_checker/data_connection_checker.dart';

abstract class NetworkInfo {
  Future<bool> get isDeviceCOnnected;
}

class NetworkInfoImpl implements NetworkInfo {
  NetworkInfoImpl(this._connectionChecker);
  final DataConnectionChecker _connectionChecker;

  @override
  Future<bool> get isDeviceCOnnected => _connectionChecker.hasConnection;
}
