part of 'number_trivia_bloc.dart';

abstract class NumberTriviaState extends Equatable {
  const NumberTriviaState();
  @override
  List<Object> get props => [];
}

class Empty extends NumberTriviaState {}
class Loading extends NumberTriviaState {}
class Loaded extends NumberTriviaState {
  final NumberTrivia trivia;
  Loaded(this.trivia);
 // it's empty like in parent class, so here
 // we override because we don't want it empty
  @override
  List<Object> get props => [trivia];
}
class Error extends NumberTriviaState {
  final String message;
  Error(this.message);
  @override
  List<Object> get props => [message];
}