
import '../../domain/entities/pokemon_entity.dart';

abstract class PokemonState {}

class SuccessPokemonState implements PokemonState {
  final List<Pokemon> pokemons;

  SuccessPokemonState(this.pokemons);
}

class EmptyPokemonState extends SuccessPokemonState {
  EmptyPokemonState() : super([]);
}

class LoadingPokemonState extends PokemonState {}

class ErrorPokemonState extends PokemonState {
  final String message;

  ErrorPokemonState(this.message);
}