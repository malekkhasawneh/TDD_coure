import 'package:equatable/equatable.dart';

abstract class Errors extends Equatable {
 final List properties =const <dynamic>[];
  Errors([properties]);
  @override
  List<Object> get props => [properties];
}

class ServerError extends Errors {}

class CacheError extends Errors {}