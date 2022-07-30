import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:dartz/dartz.dart';

import 'package:pokedex/src/modules/pokemon/domain/repositories/pokemon_repository.dart';
import 'package:pokedex/src/modules/pokemon/infra/usecases/get_pokemon_by_id_impl.dart';
import 'package:pokedex/src/modules/pokemon/domain/errors/pokemon_domain_errors.dart';
import 'package:pokedex/src/modules/pokemon/domain/usecases/get_pokemon_by_id.dart';
import 'package:pokedex/src/modules/pokemon/domain/entities/pokemon_entity.dart';

import '../../../../../mock/mocks.dart';

void main() {
   late GetPokemonById usecase;
  late PokemonRepository repository;

  setUp(() {
    repository = PokemonRepositorySpy();
    usecase = GetPokemonByIdImpl(repository);
  });

  test('Should return Pokemons if GetPokemonById execute with success',
      () async {
    when(() => repository.getPokemonById(1))
        .thenAnswer((_) async => right(pokemon));

    final result = await usecase(1);

    expect(result.fold(id, id), isA<Pokemon>());
  });
  test(
      'Should return PokemonDomainException if GetPokemonById execute with id > 1',
      () async {
    final result = await usecase(0);

    expect(result.fold(id, id), isA<PokemonDomainException>());
  });
}