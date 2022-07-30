import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'domain/entities/pokemon_entity.dart';
import 'domain/repositories/pokemon_repository.dart';
import 'domain/usecases/get_pokemons_for_list.dart';

import 'external/datasources/pokemon_datasource_impl.dart';

import 'infra/datasources/pokemon_datasource.dart';
import 'infra/repositories/pokemon_repository_impl.dart';
import 'infra/usecases/get_pokemons_for_list_impl.dart';

import 'presenter/pages/detail_page.dart';
import 'presenter/stores/pokemon_store.dart';
import 'presenter/pages/home_page.dart';

class PokemonModule extends Module {
  @override
  List<Bind> get binds => [
        //utils
        Bind.factory((_) => Dio()),

        //datasources
        Bind.factory<PokemonDatasource>((i) => PokemonDatasourceImpl(i())),

        //repositories
        Bind.factory<PokemonRepository>((i) => PokemonRepositoryImpl(i())),

        //usecases
        Bind.factory<GetPokemonsForList>((i) => GetPokemonsForListImpl(i())),

        //stores
        Bind.singleton<PokemonStore>((i) => PokemonStore(i())),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (context, args) => const HomePage()),
        ChildRoute('/detail', child: (context, args) => PokemonDetailPage(pokemon: (args.data as Pokemon))),
      ];
}
