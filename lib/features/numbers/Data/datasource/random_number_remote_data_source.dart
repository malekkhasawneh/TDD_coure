import 'package:firstproject/features/numbers/Data/models/random_number_repository.dart';

abstract class RandomNumberRemoteDataSource {
  Future<RandomNumberModel> getConcreteNumberTrivia(int number);

  Future<RandomNumberModel> getRandomNumberTrivia();
}
