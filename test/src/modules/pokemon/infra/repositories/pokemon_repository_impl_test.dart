import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pokedex/src/modules/pokemon/domain/entities/pokemon_entity.dart';

import 'package:pokedex/src/modules/pokemon/domain/repositories/pokemon_repository.dart';
import 'package:pokedex/src/modules/pokemon/infra/datasources/pokemon_datasource.dart';
import 'package:pokedex/src/modules/pokemon/infra/repositories/pokemon_repository_impl.dart';

import '../../../../../mock/mocks.dart';


void main() {
  late PokemonRepository repository;
  late PokemonDatasource datasource;

  setUp((){
    datasource = PokemonDatasourceSpy();
    repository =  PokemonRepositoryImpl(datasource);
  });

  test('Should return List of Pokemon if getPokemons execute with success', () async {

    final result = await repository.getPokemons();

    expect(result.fold(id, id), isA<List<Pokemon>>());

  });
}