import 'package:number_trivia/feature/numbers_trivia/data/models/number_trivia_model.dart';

// errors will be handled by exceptions unlike in Repo
// contract
abstract class NumberTriviaRemoteDataSource {
   Future<NumberTriviaModel> getSpecificNumberTrivia(int number);
   Future<NumberTriviaModel> getRandomNumberTrivia();
}