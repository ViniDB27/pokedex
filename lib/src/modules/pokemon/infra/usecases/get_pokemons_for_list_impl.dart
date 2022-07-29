import 'package:dartz/dartz.dart';

import '../../domain/repositories/pokemon_repository.dart';
import '../../domain/usecases/get_pokemons_for_list.dart';
import '../../domain/errors/pokemon_domain_errors.dart';
import '../../domain/entities/pokemon_entity.dart';

class GetPokemonsForListImpl extends GetPokemonsForList {
  final PokemonRepository repository;

  GetPokemonsForListImpl(this.repository);

  @override
  Future<Either<PokemonDomainException, List<Pokemon>>> call({
    int offset = 0,
    int limit = 21,
  }) async {
    return repository.getPokemons(
      offset: offset,
      limit: limit,
    );
  }
}
