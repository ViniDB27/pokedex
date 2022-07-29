import './status_entity.dart';
import './type_entity.dart';

class Pokemon {
  final int id;
  final String name;
  final int order;
  final double weight;
  final double height;
  final String image;
  final List<PokeType> types;
  final String move;
  final PokeStatus status;

  Pokemon({
    required this.id,
    required this.name,
    required this.order,
    required this.weight,
    required this.height,
    required this.image,
    required this.types,
    required this.move,
    required this.status,
  });
}