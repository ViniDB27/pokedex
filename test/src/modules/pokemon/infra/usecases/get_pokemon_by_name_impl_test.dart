import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:dartz/dartz.dart';

import 'package:pokedex/src/modules/pokemon/infra/usecases/get_pokemon_by_name_impl.dart';
import 'package:pokedex/src/modules/pokemon/domain/repositories/pokemon_repository.dart';
import 'package:pokedex/src/modules/pokemon/domain/errors/pokemon_domain_errors.dart';
import 'package:pokedex/src/modules/pokemon/domain/usecases/get_pokemon_by_name.dart';
import 'package:pokedex/src/modules/pokemon/domain/entities/pokemon_entity.dart';

import '../../../../../mock/mocks.dart';

void main() {
  late GetPokemonByName usecase;
  late PokemonRepository repository;

  setUp(() {
    repository = PokemonRepositorySpy();
    usecase = GetPokemonByNameImpl(repository);
  });

  test('Should return Pokemons if GetPokemonByName execute with success',
      () async {
    when(() => repository.getPokemonByName("name"))
        .thenAnswer((_) async => right(pokemon));

    final result = await usecase("name");

    expect(result.fold(id, id), isA<Pokemon>());
  });
  test(
      'Should return PokemonDomainException if GetPokemonByName execute with empty name',
      () async {
    final result = await usecase("");

    expect(result.fold(id, id), isA<PokemonDomainException>());
  });
}
