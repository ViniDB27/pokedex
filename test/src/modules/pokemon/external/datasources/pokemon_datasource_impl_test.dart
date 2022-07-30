import 'package:flutter_test/flutter_test.dart';
import 'package:dio/dio.dart';

import 'package:pokedex/src/modules/pokemon/external/datasources/pokemon_datasource_impl.dart';
import 'package:pokedex/src/modules/pokemon/infra/datasources/pokemon_datasource.dart';

void main() {
  late PokemonDatasource datasource;
  late Dio dio;

  setUp((){
    dio = Dio();
    datasource = PokemonDatasourceImpl(dio);
  });

  test('Should return Lis of Map if getPokemons execute with success', () async {
    final result = await datasource.getPokemons();

    expect(result, isA<List<Map>>());
  });
  
  test('Should return Lis of Map if getPokemonByName execute with success', () async {
    final result = await datasource.getPokemonByName("ditto");

    expect(result, isA<Map>());
  });

  test('Should return Lis of Map if getPokemonById execute with success', () async {
    final result = await datasource.getPokemonById(1);

    expect(result, isA<Map>());
  });
}