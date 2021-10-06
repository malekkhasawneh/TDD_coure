import 'package:dartz/dartz.dart';
import 'package:firstproject/core/error/errors.dart';
import 'package:firstproject/core/usecase/usecase.dart';
import 'package:firstproject/features/numbers/Domain/entites/random_numbers.dart';
import 'package:firstproject/features/numbers/Domain/repository/random-number-repoitories.dart';

class GetRandomNumber extends UseCase<RandomNumber, NoParams> {
  final RandomNumberRepository repository;

  GetRandomNumber(this.repository);

  @override
  Future<Either<Errors, RandomNumber>> call(NoParams params) async {
    return await repository.getRandomNumber();
  }
}
