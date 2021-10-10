import 'package:flutter/cupertino.dart';

class MessageDisplay extends StatelessWidget {
  final String message;

  MessageDisplay({required this.message});

  @override
  Widget build(BuildContext context) {
    return Container(
      // to take up a third of the screen only
      height: MediaQuery.of(context).size.height/3,
      child: Center(
        child: SingleChildScrollView(
          child: Text(
              message, style: TextStyle( fontSize: 25),
              textAlign: TextAlign.center),
        ),
      ),
    );
  }
}