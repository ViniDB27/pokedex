import '../../domain/entities/pokemon_entity.dart';
import '../../domain/entities/status_entity.dart';

class PokemonModel {
  final int id;
  final String name;
  final int order;
  final double weight;
  final double height;
  final String image;
  final List<String> types;
  final String move;
  final PokeStatus status;

  PokemonModel({
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

  factory PokemonModel.fromJson(Map<dynamic, dynamic> json) => PokemonModel(
        id: json['id'],
        name: json['name'].toString(),
        order: json['order'],
        weight: double.parse(json['weight'].toString()),
        height: double.parse(json['height'].toString()),
        image: json['sprites']['other']["official-artwork"]["front_default"] ??
            json['sprites']['other']["dream_world"]["front_default"] ??
            json['sprites']['front_default'] ??
            "https://www.purarteadesivos.com.br/wp-content/uploads/2017/04/adesivo-personalizado-pokebola-pokemon-recorte-eletronico-geek-nerd-gamer-pura-arte-adesivos.png",
        types: json['types']
            .map((element) => element['type']['name'])
            .cast<String>()
            .toList() as List<String>,
        move: (json['moves'] as List).length > 0
            ? json['moves'][0]['move']['name'].toString()
            : "No move",
        status: PokeStatus(
          life: double.parse(json['stats'][0]['base_stat'].toString()),
          attack: double.parse(json['stats'][1]['base_stat'].toString()),
          defense: double.parse(json['stats'][2]['base_stat'].toString()),
          special_attack:
              double.parse(json['stats'][3]['base_stat'].toString()),
          special_defense:
              double.parse(json['stats'][4]['base_stat'].toString()),
          speed: double.parse(json['stats'][5]['base_stat'].toString()),
        ),
      );

  Pokemon get toEntity => Pokemon(
        id: id,
        name: name,
        order: order,
        weight: weight,
        height: height,
        image: image,
        types: types,
        move: move,
        status: status,
      );
}
