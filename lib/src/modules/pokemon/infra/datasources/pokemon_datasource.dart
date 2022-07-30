abstract class PokemonDatasource {
  Future<List<Map<dynamic, dynamic>>> getPokemons({
    int offset = 0,
    int limit = 21,
    String? type,
  });
}
