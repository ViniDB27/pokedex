import 'package:dio/dio.dart';

import '../../infra/datasources/pokemon_datasource.dart';

class PokemonDatasourceImpl extends PokemonDatasource {
  final String urlBase = "https://pokeapi.co/api/v2";

  final Dio dio;

  PokemonDatasourceImpl(this.dio);

  @override
  Future<List<Map<dynamic, dynamic>>> getPokemons({
    int offset = 0,
    int limit = 21,
    String? type,
  }) async {
    final String url = type != null
        ? "$urlBase/type/$type?offset=$offset&limit=$limit"
        : "$urlBase/pokemon?offset=$offset&limit=$limit";

    final response = await dio.get(url);
    final Map<String, dynamic> body = response.data;
    final List<dynamic> results =
        type != null ? body['pokemon'] : body['results'];

    final List<Map<dynamic, dynamic>> pokemons = [];

    for (var i = 0; i < results.length; i++) {
      final pkmUrl = type != null ? results[i]['pokemon']['url'] : results[i]['url']; 
      final pokemonResponse = await dio.get(pkmUrl);
      final Map<dynamic, dynamic> pokemonBody = pokemonResponse.data;
      pokemons.add(pokemonBody);
    }

    return pokemons;
  }
}
