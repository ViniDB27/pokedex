import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pokedex/src/modules/pokemon/domain/entities/pokemon_entity.dart';
import 'package:pokedex/src/modules/pokemon/domain/errors/pokemon_domain_errors.dart';

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
    when(() => datasource.getPokemons()).thenAnswer((_) async=> pokemonListOfJson);


    final result = await repository.getPokemons();

    expect(result.fold(id, id), isA<List<Pokemon>>());
  });
 
  test('Should return PokemonDomainException if getPokemons execute without success', () async {
    when(() => datasource.getPokemons()).thenThrow((_) => PokemonDomainException('Falha na request'));


    final result = await repository.getPokemons();

    expect(result.fold(id, id), isA<PokemonDomainException>());
  });
  
  test('Should return Pokemon if getPokemonByname execute with success', () async {
    when(() => datasource.getPokemonByName("name")).thenAnswer((_) async=> pokemonJson);


    final result = await repository.getPokemonByName("name");

    expect(result.fold(id, id), isA<Pokemon>());
  });
 
  test('Should return PokemonDomainException if getPokemonByName execute without success', () async {
    when(() => datasource.getPokemonByName("name")).thenThrow((_) => PokemonDomainException('Falha na request'));


    final result = await repository.getPokemonByName("name");

    expect(result.fold(id, id), isA<PokemonDomainException>());
  });
  test('Should return Pokemon if getPokemonById execute with success', () async {
    when(() => datasource.getPokemonById(1)).thenAnswer((_) async=> pokemonJson);


    final result = await repository.getPokemonById(1);

    expect(result.fold(id, id), isA<Pokemon>());
  });
 
  test('Should return PokemonDomainException if getPokemonById execute without success', () async {
    when(() => datasource.getPokemonById(1)).thenThrow((_) => PokemonDomainException('Falha na request'));


    final result = await repository.getPokemonById(1);

    expect(result.fold(id, id), isA<PokemonDomainException>());
  });
}