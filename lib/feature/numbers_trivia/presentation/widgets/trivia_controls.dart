import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:number_trivia/feature/numbers_trivia/presentation/bloc/number_trivia_bloc.dart';

class TriviaControls extends StatefulWidget {
  const TriviaControls({Key? key}) : super(key: key);

  @override
  _TriviaControlsState createState() => _TriviaControlsState();
}

class _TriviaControlsState extends State<TriviaControls> {
  final controller = TextEditingController();
  String inputStr = '';

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // TextField
        TextField(
          controller: controller,
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            hintText: 'Input a number',
          ),
          onChanged: (value) {
            inputStr = value;
          },
          onSubmitted: (_) => addSpecific(),
        ),
        SizedBox(height: 10),
        Row(
          children: [
            Expanded(
              // Search concrete button
              child: MaterialButton(
                child: Text('Search'),
                textTheme: ButtonTextTheme.primary,
                color: Theme.of(context).accentColor,
                onPressed: addSpecific,
              ),
            ),
            SizedBox(width: 10),
            Expanded(
              // Random button
              child: MaterialButton(
                child: Text('get Random'),
                onPressed: addRandom,
              ),
            )
          ],
        )
      ],
    );
  }

  void addSpecific() {
    controller.clear();
    BlocProvider.of<NumberTriviaBloc>(context)
        .add(GetTriviaForSpecificNumber(inputStr));
  }

  void addRandom() {
    controller.clear();
    BlocProvider.of<NumberTriviaBloc>(context).add(GetTriviaForRandomNumber());
  }
}
