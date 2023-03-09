import 'package:equatable/equatable.dart';

/// use https://marketplace.visualstudio.com/items?itemName=BendixMa.dart-data-class-generator
class YouAwesomeModel extends Equatable {
  final int id;
  final String name;

  YouAwesomeModel(this.id, this.name);

  @override
  List<Object> get props => [id, name];

}
