import 'package:dartz/dartz.dart';

import '../errors/pokemon_domain_errors.dart';
import '../entities/pokemon_entity.dart';

abstract class GetPokemonsForList {
  Future<Either<PokemonDomainException, List<Pokemon>>> call({int offset = 0, int limit = 21});
}