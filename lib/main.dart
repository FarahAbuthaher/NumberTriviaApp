import 'package:flutter/material.dart';

void main() {
  runApp(NumbersTriviaApp());
}
 class NumbersTriviaApp extends StatelessWidget {
   const NumbersTriviaApp({Key? key}) : super(key: key);

   @override
   Widget build(BuildContext context) {
     return MaterialApp(
       debugShowCheckedModeBanner: false,
       title: 'Numbers Trivia',
       home: NumbersTriviaHome();
     );
   }
 }
