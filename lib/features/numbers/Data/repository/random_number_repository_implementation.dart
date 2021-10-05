import 'package:dartz/dartz.dart';
import 'package:firstproject/core/error/errors.dart';
import 'package:firstproject/core/error/exception.dart';
import 'package:firstproject/core/platform/network_info.dart';
import 'package:firstproject/features/numbers/Data/datasource/random_number_local_data_source.dart';
import 'package:firstproject/features/numbers/Data/datasource/random_number_remote_data_source.dart';
import 'package:firstproject/features/numbers/Data/models/random_number_model.dart';
import 'package:firstproject/features/numbers/Domain/entites/random_numbers.dart';
import 'package:firstproject/features/numbers/Domain/repository/random-number-repoitories.dart';

typedef Future<RandomNumberModel> ConcreteOrRandomChooser();

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

  Future<Either<Errors, RandomNumber>> getTrivia(
    ConcreteOrRandomChooser getConcreteOrRandom,
  ) async {
    if (await networkInfo.isConnected) {
      try {
        final remoteRandomNumber = await getConcreteOrRandom();
        localDataSource.cacheRandomNumber(remoteRandomNumber);
        return Right(remoteRandomNumber);
      } on ServerException {
        return Left(ServerError());
      }
    } else {
      try {
        final localRandomNumber = await localDataSource.getLastRandomNumber();
        return Right(localRandomNumber);
      } on CacheException {
        return Left(CacheError());
      }
    }
  }
}
