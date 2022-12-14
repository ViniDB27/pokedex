import 'package:dartz/dartz.dart';

import '../errors/pokemon_domain_errors.dart';
import '../entities/pokemon_entity.dart';

abstract class PokemonRepository {
  Future<Either<PokemonDomainException, List<Pokemon>>> getPokemons({
    int offset = 0,
    int limit = 21,
    String? type,
  });

  Future<Either<PokemonDomainException, Pokemon>> getPokemonByName(String name);
  Future<Either<PokemonDomainException, Pokemon>> getPokemonById(int id);
}
