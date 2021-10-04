import 'package:dartz/dartz.dart';
import 'package:firstproject/core/error/errors.dart';
import 'package:firstproject/core/platform/network_info.dart';
import 'package:firstproject/features/numbers/Data/datasource/random_number_local_data_source.dart';
import 'package:firstproject/features/numbers/Data/datasource/random_number_remote_data_source.dart';
import 'package:firstproject/features/numbers/Domain/entites/random_numbers.dart';
import 'package:firstproject/features/numbers/Domain/repository/random-number-repoitories.dart';

class RandomNumberRepositoryImpl implements RandomNumberRepository {
  final RandomNumberRemoteDataSource remoteDataSource;
  final RandomNumberLocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  RandomNumberRepositoryImpl(
      {required this.localDataSource,
      required this.networkInfo,
      required this.remoteDataSource});

  @override
  Future<Either<Errors, RandomNumber>> getConcreteRandomNumber(int number) {
    throw UnimplementedError();
  }

  @override
  Future<Either<Errors, RandomNumber>> getRandomNumber() {
    throw UnimplementedError();
  }
}
