import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class NumberTriviaEvent extends Equatable {
  List properties = const <dynamic>[];

  NumberTriviaEvent([properties]);

  List<Object?> get props => [properties];
}

class GetForConcreteNumber extends NumberTriviaEvent {
  final String numberString;

  GetForConcreteNumber(this.numberString);

  @override
  List<Object?> get props => [numberString];
}

class GetForRandomNumber extends NumberTriviaEvent {
  @override
  List<Object?> get props => [];
}
