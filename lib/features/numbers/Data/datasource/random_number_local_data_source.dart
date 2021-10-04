import 'package:firstproject/features/numbers/Data/models/random_number_repository.dart';

abstract class RandomNumberLocalDataSource {
  Future<RandomNumberModel> getLastNumberTrivia();

  Future<void> cacheNumberTrivia(RandomNumberModel triviaToCache);
}
