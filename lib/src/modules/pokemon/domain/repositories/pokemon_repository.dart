import 'package:dartz/dartz.dart';

import '../errors/pokemon_domain_errors.dart';
import '../entities/pokemon_entity.dart';

abstract class PokemonRepository {
  Future<Either<PokemonDomainException, List<Pokemon>>> getPokemons({int offset = 0, int limit = 21});
}