import 'package:flutter_test/flutter_test.dart';
import 'package:dio/dio.dart';
import 'package:mocktail/mocktail.dart';

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
}