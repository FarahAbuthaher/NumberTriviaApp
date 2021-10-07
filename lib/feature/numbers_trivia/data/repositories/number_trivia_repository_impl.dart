import 'package:dartz/dartz.dart';
import 'package:number_trivia/core/error/exception.dart';
import 'package:number_trivia/core/error/failure.dart';
import 'package:number_trivia/core/network/network_info.dart';
import 'package:number_trivia/feature/numbers_trivia/data/dataSources/number_trivia_local_dataSource.dart';
import 'package:number_trivia/feature/numbers_trivia/data/dataSources/number_trivia_remote_dataSource.dart';
import 'package:number_trivia/feature/numbers_trivia/data/models/number_trivia_model.dart';
import 'package:number_trivia/feature/numbers_trivia/domain/entities/number_trivia.dart';
import 'package:number_trivia/feature/numbers_trivia/domain/repositories/number_trivia_repository.dart';

//makes the decision on which data source to use
typedef Future<NumberTriviaModel> _SpecificOrRandom();

class NumberTriviaRepositoryImpl implements NumberTriviaRepository {
  final NumberTriviaRemoteDataSource remoteDataSource;
  final NumberTriviaLocalDataSource localDataSource;
  final NetworkInfo networkInfo;


  NumberTriviaRepositoryImpl(
      {required this.remoteDataSource, required this.localDataSource, required this.networkInfo});

  @override
  Future<Either<Failure, NumberTrivia>> getRandomNumberTrivia() async {
    return await _getTrivia(() =>
        remoteDataSource.getRandomNumberTrivia());
  }

  @override
  Future<Either<Failure, NumberTrivia>> getSpecificNumberTrivia(
      int number) async {
    return await _getTrivia(() =>
        remoteDataSource.getSpecificNumberTrivia(number));
  }

// To prevent code repetition
  Future<Either<Failure, NumberTrivia>> _getTrivia(
      _SpecificOrRandom getSpecificOrRandom) async {
    if (await networkInfo.isConnected) {
      // Number Trivia model object created with remote data
      try {
        final remoteTrivia =
        await getSpecificOrRandom();
        // adds data to cache
        localDataSource.cacheNumberTrivia(remoteTrivia);
        return Right(remoteTrivia);
      } on ServerException {
        // server failure is type failure which is Left
        return Left(ServerFailure());
      }
    }
    // when connection to network fails
    else {
      try {
        final localTrivia = await localDataSource.getLastNumberTrivia();
        return Right(localTrivia);
      }
      on CacheException {
        return Left(CacheFailure());
      }
    }
  }
}
