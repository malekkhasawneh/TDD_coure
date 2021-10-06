import 'package:equatable/equatable.dart';
import 'package:firstproject/features/numbers/Domain/entites/random_numbers.dart';
import 'package:meta/meta.dart';


@immutable
abstract class NumberTriviaState extends Equatable {
  List properties = const <dynamic>[];
  NumberTriviaState([properties]);
  List<Object?> get props => [properties];
}

class IsEmpty extends NumberTriviaState {}

class Loading extends NumberTriviaState {}

class IsLoaded extends NumberTriviaState {
  final RandomNumber trivia;

  IsLoaded({required this.trivia});
  List<Object?> get props => [trivia];
}

class Error extends NumberTriviaState {
  final String message;

  Error({required this.message});
  List<Object?> get props => [message];
}