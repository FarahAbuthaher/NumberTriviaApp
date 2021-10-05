import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:number_trivia/core/error/exception.dart';
import 'package:number_trivia/feature/numbers_trivia/data/models/number_trivia_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
// contract
abstract class NumberTriviaLocalDataSource{

Future<NumberTriviaModel> getLastNumberTrivia();

Future<void> cacheNumberTrivia(NumberTriviaModel triviaCached);
}
// give key to data
const CACHED_NUMBER_TRIVIA = 'CACHED_NUMBER_TRIVIA';

class NumberTriviaLocalDataSourceImpl implements NumberTriviaLocalDataSource {
 final SharedPreferences sharedPreferences;

 NumberTriviaLocalDataSourceImpl(this.sharedPreferences);

 // setting data
  @override
  Future<void> cacheNumberTrivia(NumberTriviaModel triviaCached) {
 return sharedPreferences.setString(CACHED_NUMBER_TRIVIA, json.encode(triviaCached.toJson()));
  }
 // getting data
  @override
  Future<NumberTriviaModel> getLastNumberTrivia() {
    final jsonString = sharedPreferences.getString(CACHED_NUMBER_TRIVIA);
    if(jsonString != null)
    return Future.value(NumberTriviaModel.fromJson(json.decode(jsonString)));
    else throw CacheException();
  }

}