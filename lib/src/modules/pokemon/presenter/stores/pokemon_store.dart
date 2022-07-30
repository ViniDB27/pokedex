import 'package:flutter/material.dart';

import '../../domain/usecases/get_pokemon_by_id.dart';
import '../../domain/usecases/get_pokemons_for_list.dart';
import '../../domain/usecases/get_pokemon_by_name.dart';
import '../states/pokemon_state.dart';

class PokemonStore extends ValueNotifier<PokemonState> {
  final GetPokemonsForList getPokemonsForList;
  final GetPokemonByName getPokemonByName;
  final GetPokemonById getPokemonById;

  PokemonStore({
    required this.getPokemonsForList,
    required this.getPokemonByName,
    required this.getPokemonById,
  }) : super(EmptyPokemonState());

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

  Future<void> searchPokemonByName(String name) async {
    emit(LoadingSearchPokemonState());

    final result = await getPokemonByName(name);

    final newState = result.fold((l) {
      return ErrorPokemonState(l.message);
    }, (r) {
      return SuccessPokemonOnlyState(r);
    });

    emit(newState);
  }
  
  Future<void> searchPokemonById(int id) async {
    emit(LoadingSearchPokemonState());

    final result = await getPokemonById(id);

    final newState = result.fold((l) {
      return ErrorPokemonState(l.message);
    }, (r) {
      return SuccessPokemonOnlyState(r);
    });

    emit(newState);
  }
}
