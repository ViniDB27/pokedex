import 'package:dartz/dartz.dart';
import 'package:pokedex/src/modules/pokemon/infra/models/pokemon_model.dart';

import '../../domain/repositories/pokemon_repository.dart';
import '../../domain/errors/pokemon_domain_errors.dart';
import '../../domain/entities/pokemon_entity.dart';

import '../datasources/pokemon_datasource.dart';

class PokemonRepositoryImpl extends PokemonRepository {
  final PokemonDatasource datasource;

  PokemonRepositoryImpl(this.datasource);

  @override
  Future<Either<PokemonDomainException, List<Pokemon>>> getPokemons({
    int offset = 0,
    int limit = 21,
  }) async {
    try {
      final response = await datasource.getPokemons(
        limit: limit,
        offset: offset,
      );

      final List<Pokemon> pokemons = response
          .map((pokemon) => PokemonModel.fromJson(pokemon).toEntity)
          .cast<Pokemon>()
          .toList();

      return right(pokemons);
    } catch (error) {
      return left(PokemonDomainException(error.toString()));
    }
  }
}
