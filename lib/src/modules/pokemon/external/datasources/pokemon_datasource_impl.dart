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
  }) async {
    final String url = "$urlBase/pokemon?offset=$offset&limit=$limit";

    final response = await dio.get(url);
    final Map<String, dynamic> body = response.data;
    final List<dynamic> results = body['results'];

    final List<Map<dynamic, dynamic>> pokemons = [];

    for (var i = 0; i < results.length; i++) {
      final pokemonResponse = await dio.get( results[i]['url']);
      final Map<dynamic, dynamic> body = pokemonResponse.data;
      pokemons.add(body);
    }

    return pokemons;
  }
}
