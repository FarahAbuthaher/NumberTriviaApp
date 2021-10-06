import 'package:dartz/dartz.dart';
import 'package:number_trivia/core/error/failure.dart';
import 'package:number_trivia/feature/numbers_trivia/domain/entities/number_trivia.dart';

// Contract Repository, meaning this where we DEFINE what the repo will do
abstract class NumberTriviaRepository {
  Future<Either<Failure, NumberTrivia>> getSpecificNumberTrivia(int number);

  Future<Either<Failure, NumberTrivia>> getRandomNumberTrivia();
}
