
import '../../domain/entities/pokemon_entity.dart';

abstract class PokemonState {}

class SuccessPokemonOnlyState implements PokemonState {
  final Pokemon pokemon;

  SuccessPokemonOnlyState(this.pokemon);
}
class SuccessPokemonState implements PokemonState {
  final List<Pokemon> pokemons;

  SuccessPokemonState(this.pokemons);
}

class EmptyPokemonState extends SuccessPokemonState {
  EmptyPokemonState() : super([]);
}

class LoadingPokemonState extends PokemonState {}

class LoadingSearchPokemonState extends PokemonState {}

class ErrorPokemonState extends PokemonState {
  final String message;

  ErrorPokemonState(this.message);
}