import 'dart:convert';

import 'package:number_trivia/core/error/exception.dart';
import 'package:number_trivia/feature/numbers_trivia/data/models/number_trivia_model.dart';
import 'package:http/http.dart' as http;
// errors will be handled by exceptions unlike in Repo
// contract
abstract class NumberTriviaRemoteDataSource {
   Future<NumberTriviaModel> getSpecificNumberTrivia(int number);
   Future<NumberTriviaModel> getRandomNumberTrivia();
}

class NumberTriviaRemoteDataSourceImpl implements NumberTriviaRemoteDataSource {
   final http.Client client;

   NumberTriviaRemoteDataSourceImpl(this.client);

   @override
  Future<NumberTriviaModel> getRandomNumberTrivia() => getNumberTriviaData('http://numbersapi.com/random');

  @override
  Future<NumberTriviaModel> getSpecificNumberTrivia(int number) =>  getNumberTriviaData('http://numbersapi.com/$number');

   Future<NumberTriviaModel> getNumberTriviaData(String url) async {
      final response = await client.get(Uri.parse
         (url),
          headers: {'Content-Type': 'application/json'}
      );
      if(response.statusCode == 200)
         return NumberTriviaModel.fromJson(json.decode(response.body));
      else throw ServerException();
   }

}