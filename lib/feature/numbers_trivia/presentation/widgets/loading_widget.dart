import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoadingWidget extends StatelessWidget {
  // to ensure the circular Indicator doesn't jump around or ruin the display, it was put in a fixed container size
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height/3,
      child: Center(child: CircularProgressIndicator(),),
    );
  }
}