import 'package:number_trivia/feature/numbers_trivia/domain/entities/number_trivia.dart';

class NumberTriviaModel extends NumberTrivia {
  NumberTriviaModel({required int number, required String text})
      : super(number: number, text: text);
 // turns map into NumberTriviaModel object
  factory NumberTriviaModel.fromJson(Map<String, dynamic> numJson) {
    return NumberTriviaModel(number: (numJson['number'] as num).toInt(), text: numJson['text']);
  }
  // Takes an object and turns it into a map
  Map<String, dynamic> toJson() {
    return {'number':number, 'text': text};
}
}
