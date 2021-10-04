import 'package:equatable/equatable.dart';

class Errors extends Equatable {
  List properties = const <dynamic>[];

  Errors(this.properties);

  @override
  List<Object?> get props => [Errors(properties)];
}

class ServerError extends Errors {
  ServerError(List properties) : super(properties);
}

class CacheError extends Errors {
  CacheError(List properties) : super(properties);
}