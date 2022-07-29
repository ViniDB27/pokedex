import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:dartz/dartz.dart';


import 'package:pokedex/src/modules/pokemon/domain/errors/pokemon_domain_errors.dart';
import 'package:pokedex/src/modules/pokemon/infra/usecases/get_pokemons_for_list_impl.dart';
import 'package:pokedex/src/modules/pokemon/domain/repositories/pokemon_repository.dart';
import 'package:pokedex/src/modules/pokemon/domain/usecases/get_pokemons_for_list.dart';
import 'package:pokedex/src/modules/pokemon/domain/entities/pokemon_entity.dart';

import '../../../../../mock/mocks.dart';

void main() {
  late GetPokemonsForList usecase;
  late PokemonRepository repository;

  setUp(() {
    repository = PokemonRepositorySpy();
    usecase = GetPokemonsForListImpl(repository);
  });

  test(
      'Should return List of Pokemons if GetPokemonsForList execute with success',
      () async {
    when(() => repository.getPokemons())
        .thenAnswer((_) async => right([pokemon]));

    final result = await usecase();

    expect(result.fold(id, id), isA<List<Pokemon>>());
  });

  test(
      'Should return PokemonDomainException if GetPokemonsForList execute without success',
      () async {
    when(() => repository.getPokemons()).thenAnswer(
      (_) async => left(
        PokemonDomainException('pokemon não encontrado'),
      ),
    );

    final result = await usecase();

    expect(result.fold(id, id), isA<PokemonDomainException>());
  });
}
