import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:firstproject/core/error/errors.dart';
import 'package:firstproject/features/numbers/Domain/entites/random_numbers.dart';
import 'package:firstproject/features/numbers/Domain/repository/random-number-repoitories.dart';

class GetConcreteRandomNumber {
  final RandomNumberRepository repository;

  GetConcreteRandomNumber(this.repository);

  Future<Either<Errors, RandomNumber>> call(Parameters params) async {
    return await repository.getConcreteRandomNumber(params.number);
  }
}

class Parameters extends Equatable {
  final int number;

  Parameters({required this.number});

  @override
  List<Object?> get props => [Parameters(number: number)];
}
