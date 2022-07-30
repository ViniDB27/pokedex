import 'package:dartz/dartz.dart';

import '../../domain/entities/pokemon_entity.dart';
import '../../domain/errors/pokemon_domain_errors.dart';
import '../../domain/repositories/pokemon_repository.dart';
import '../../domain/usecases/get_pokemon_by_id.dart';

class GetPokemonByIdImpl extends GetPokemonById {
  final PokemonRepository repository;

  GetPokemonByIdImpl(this.repository);

  @override
  Future<Either<PokemonDomainException, Pokemon>> call(int id) async {
    if(id < 1){
      return left(PokemonDomainException("invalid id"));
    }

    return repository.getPokemonById(id);
  }
}
