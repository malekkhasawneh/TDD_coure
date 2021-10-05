import 'package:firstproject/features/numbers/Domain/entites/random_numbers.dart';

class RandomNumberModel extends RandomNumber {
  RandomNumberModel({
    required String text,
    required int number,
  }) : super(
          text: text,
          number: number,
        );

  factory RandomNumberModel.fromJson(Map<String, dynamic> json) {
    return RandomNumberModel(
      text: json['text'],
      number:
          (json['number'] as num) // we used (num) to can use both int and double.
              .toInt(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'text': text,
      'number': number,
    };
  }
}
