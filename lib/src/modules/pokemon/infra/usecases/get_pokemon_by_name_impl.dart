import 'package:dartz/dartz.dart';

import '../../domain/entities/pokemon_entity.dart';
import '../../domain/errors/pokemon_domain_errors.dart';
import '../../domain/repositories/pokemon_repository.dart';
import '../../domain/usecases/get_pokemon_by_name.dart';

class GetPokemonByNameImpl extends GetPokemonByName {
  final PokemonRepository repository;

  GetPokemonByNameImpl(this.repository);

  @override
  Future<Either<PokemonDomainException, Pokemon>> call(String name) async {
    if(name.isEmpty){
      return left(PokemonDomainException("invalid name"));
    }

    return repository.getPokemonByName(name);
  }
}
