import 'package:dartz/dartz.dart';

import '../entities/pokemon_entity.dart';
import '../errors/pokemon_domain_errors.dart';

abstract class GetPokemonById {
  Future<Either<PokemonDomainException, Pokemon>> call(int id);
}
