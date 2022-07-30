abstract class PokemonDatasource {
  Future<List<Map<dynamic, dynamic>>> getPokemons({
    int offset = 0,
    int limit = 21,
    String? type,
  });
  Future<Map<dynamic, dynamic>> getPokemonByName(String name);
  Future<Map<dynamic, dynamic>> getPokemonById(int id);
}
