import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:number_trivia/core/error/failure.dart';
import 'package:number_trivia/core/usecase/usecase.dart';
import 'package:number_trivia/feature/numbers_trivia/domain/entities/number_trivia.dart';
import 'package:number_trivia/feature/numbers_trivia/domain/repositories/number_trivia_repository.dart';

// in usecase we create classes to use the business objects (i.e business logic);

class GetSpecificNumberTrivia extends UseCase<NumberTrivia,Params> {
  final NumberTriviaRepository repository;
  GetSpecificNumberTrivia(this.repository);

  Future<Either<Failure, NumberTrivia>> call(Params params)
  async {
    return await repository.getSpecificNumberTrivia(params.number);
  }
}

// no real logic, just getting data from Repo

class Params extends Equatable{
  final int number;

  Params({required this.number});

  @override
  // TODO: implement props
  List<Object?> get props => [Params(number: number)];

}