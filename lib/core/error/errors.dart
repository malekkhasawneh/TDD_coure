import 'package:equatable/equatable.dart';

abstract class Errors extends Equatable {
  @override
  List<Object> get props => [];
}

class ServerError extends Errors {}

class CacheError extends Errors {}