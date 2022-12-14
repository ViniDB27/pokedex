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
    String? type,
  }) async {
    try {
      final response = await datasource.getPokemons(
        limit: limit,
        offset: offset,
        type: type,
      );

      List<Pokemon> pokemons = response
          .map((pokemon) => PokemonModel.fromJson(pokemon).toEntity)
          .toList();

      return right(pokemons);
    } catch (error) {
      return left(PokemonDomainException(error.toString()));
    }
  }

  @override
  Future<Either<PokemonDomainException, Pokemon>> getPokemonByName(
      String name) async {
    try {
      final response = await datasource.getPokemonByName(name);

      final pokemon = PokemonModel.fromJson(response).toEntity;

      return right(pokemon);
    } catch (error) {
      return left(PokemonDomainException(error.toString()));
    }
  }
  
  @override
  Future<Either<PokemonDomainException, Pokemon>> getPokemonById(int id) async {
    try {
      final response = await datasource.getPokemonById(id);

      final pokemon = PokemonModel.fromJson(response).toEntity;

      return right(pokemon);
    } catch (error) {
      return left(PokemonDomainException(error.toString()));
    }
  }
}
