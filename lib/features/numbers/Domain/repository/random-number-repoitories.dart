import 'package:dartz/dartz.dart';
import 'package:firstproject/core/error/errors.dart';
import 'package:firstproject/features/numbers/Domain/entites/random_numbers.dart';

abstract class RandomNumberRepository {
  Future<Either<Errors, RandomNumber>> getConcreteRandomNumber(int number);

  Future<Either<Errors, RandomNumber>> getRandomNumber();
}
