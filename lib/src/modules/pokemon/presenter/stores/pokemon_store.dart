import 'package:flutter/material.dart';

import '../../domain/usecases/get_pokemons_for_list.dart';
import '../states/pokemon_state.dart';

class PokemonStore extends ValueNotifier<PokemonState> {
  final GetPokemonsForList getPokemonsForList;

  PokemonStore(this.getPokemonsForList) : super(EmptyPokemonState());

  void emit(PokemonState newState) => value = newState;

  Future<void> listPokemons({
    int offset = 0,
    int limit = 21,
    String? type,
  }) async {
    emit(LoadingPokemonState());

    final result = await getPokemonsForList(
      limit: limit,
      offset: offset,
      type: type,
    );

    final newState = result.fold((l) {
      return ErrorPokemonState(l.message);
    }, (r) {
      return SuccessPokemonState(r);
    });

    emit(newState);
  }
}
