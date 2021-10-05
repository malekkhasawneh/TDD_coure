import 'package:firstproject/features/numbers/Data/models/random_number_model.dart';

abstract class RandomNumberRemoteDataSource {
  Future<RandomNumberModel> getConcreteRandomNumber(int number);

  Future<RandomNumberModel> getRandomNumber();
}
