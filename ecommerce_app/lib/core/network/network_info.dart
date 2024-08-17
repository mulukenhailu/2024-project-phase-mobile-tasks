import 'package:internet_connection_checker/internet_connection_checker.dart';

abstract class NetworkInfo {
  Future<bool> get isConnected;
}

class NetworkInfoImpl implements NetworkInfo {
  final InternetConnectionChecker internetchecker;
  NetworkInfoImpl(this.internetchecker);
  @override
  Future<bool> get isConnected => internetchecker.hasConnection;
}
