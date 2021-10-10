import 'package:flutter/material.dart';
import 'feature/numbers_trivia/presentation/pages/numbers_trivia_home.dart';
import 'injection_container.dart' as di;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(NumbersTriviaApp());
}

 class NumbersTriviaApp extends StatelessWidget {
   const NumbersTriviaApp({Key? key}) : super(key: key);

   @override
   Widget build(BuildContext context) {
     return MaterialApp(
       debugShowCheckedModeBanner: false,
       title: 'Numbers Trivia',
       theme: ThemeData(
         primaryColor: Colors.indigo,
         accentColor: Colors.indigoAccent
       ),
       home: NumbersTriviaHome()
     );
   }
 }
