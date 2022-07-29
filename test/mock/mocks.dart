import 'package:mocktail/mocktail.dart';

import 'package:pokedex/src/modules/pokemon/domain/repositories/pokemon_repository.dart';
import 'package:pokedex/src/modules/pokemon/infra/datasources/pokemon_datasource.dart';
import 'package:pokedex/src/modules/pokemon/domain/entities/pokemon_entity.dart';
import 'package:pokedex/src/modules/pokemon/domain/entities/status_entity.dart';
import 'package:pokedex/src/modules/pokemon/domain/entities/type_entity.dart';

class PokemonRepositorySpy extends Mock implements PokemonRepository {}

class PokemonDatasourceSpy extends Mock implements PokemonDatasource {}

final type = PokeType(name: 'fire');
final status = PokeStatus(
  life: 1,
  attack: 1,
  defense: 1,
  special_attack: 1,
  special_defense: 1,
  speed: 1,
);

final pokemon = Pokemon(
  id: 1,
  name: 'name',
  order: 1,
  weight: 1,
  height: 1,
  image: 'image',
  types: [type],
  move: 'move',
  status: status,
);

final pokemonListOfJson = [
  {
    'id': 1,
    'name': "name",
    'order': 1,
    'height': 1,
    'weight': 1,
    'sprites': {
      'other': {
        'official-artwork': {
          'front_default': 'image',
        }
      }
    },
    'types': [
      {'name': 'fire'}
    ],
    'stats': [
      {'base_stat': 1},
      {'base_stat': 1},
      {'base_stat': 1},
      {'base_stat': 1},
      {'base_stat': 1},
      {'base_stat': 1},
    ],
  }
];
