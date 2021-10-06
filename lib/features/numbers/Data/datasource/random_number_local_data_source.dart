import 'dart:convert';

import 'package:firstproject/core/error/exception.dart';
import 'package:firstproject/features/numbers/Data/models/random_number_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class RandomNumberLocalDataSource {
  Future<RandomNumberModel> getLastRandomNumber();

  Future<void> cacheRandomNumber(RandomNumberModel randomToCache);
}
class NumberTriviaLocalDataSourceImpl implements RandomNumberLocalDataSource {
  final SharedPreferences sharedPreferences;

  NumberTriviaLocalDataSourceImpl({required this.sharedPreferences});

  @override
  Future<void> cacheRandomNumber(RandomNumberModel randomToCache) {
    return sharedPreferences.setString(
      'CACHED_NUMBER_TRIVIA',
      json.encode(randomToCache.toJson()),
    );
  }

  @override
  Future<RandomNumberModel> getLastRandomNumber() {
    final jsonString = sharedPreferences.getString('CACHED_NUMBER_TRIVIA');
    if (jsonString != null) {
      return Future.value(RandomNumberModel.fromJson(json.decode(jsonString)));
    } else {
      throw CacheException();
    }
  }

}