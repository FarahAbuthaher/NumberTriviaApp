import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable{
List<dynamic> properties = [];
  Failure(this.properties);
}