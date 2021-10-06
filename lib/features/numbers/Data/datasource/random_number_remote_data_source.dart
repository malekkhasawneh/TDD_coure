import 'dart:convert';

import 'package:firstproject/core/error/exception.dart';
import 'package:firstproject/features/numbers/Data/models/random_number_model.dart';
import 'package:http/http.dart' as http;

abstract class RandomNumberRemoteDataSource {
  Future<RandomNumberModel> getConcreteRandomNumber(int number);

  Future<RandomNumberModel> getRandomNumber();
}

class RandomNumberRemoteDataSourceImpl implements RandomNumberRemoteDataSource {
  final http.Client client;

  RandomNumberRemoteDataSourceImpl({required this.client});

  @override
  Future<RandomNumberModel> getConcreteRandomNumber(int number) =>
      _getTriviaFromUrl('http://numbersapi.com/$number');

  @override
  Future<RandomNumberModel> getRandomNumber() =>
      _getTriviaFromUrl('http://numbersapi.com/random');

  Future<RandomNumberModel> _getTriviaFromUrl(String url) async {
    final response = await client.get(
      url,
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      return RandomNumberModel.fromJson(json.decode(response.body));
    } else {
      throw ServerException();
    }
  }
}
