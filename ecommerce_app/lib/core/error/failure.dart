import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final String message;

  const Failure({required this.message});

  @override
  List<Object> get props => [message];
}

class ServerFailure extends Failure {
  const ServerFailure({required super.message});
}

class ConnectionFailure extends Failure {
  const ConnectionFailure({required super.message});
}

class DataBaseFailure extends Failure {
  const DataBaseFailure({required super.message});
}

class CacheFailure extends Failure {
  const CacheFailure({required super.message});
}

