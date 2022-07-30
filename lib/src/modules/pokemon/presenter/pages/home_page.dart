import 'dart:math';

import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:infinite_scroll/infinite_scroll_grid.dart';

import '../../../../shared/theme/app_colors.dart';
import '../../../../shared/theme/app_fonts.dart';
import '../../../../shared/theme/app_images.dart';

import '../../domain/entities/pokemon_entity.dart';
import '../states/pokemon_state.dart';
import '../stores/pokemon_store.dart';
import 'components/pokemon_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final searchController = TextEditingController();

  List<Pokemon> _pokemons = [];
  bool isLoadingSearch = false;
  bool isLoading = false;
  String? error;

  String selectedType = 'disable';

  List<DropdownMenuItem<String>> get dropdownItems {
    List<DropdownMenuItem<String>> menuItems = [
      const DropdownMenuItem(value: 'disable', child: Text('Type')),
      const DropdownMenuItem(value: 'normal', child: Text('Normal')),
      const DropdownMenuItem(value: 'fighting', child: Text('Fighting')),
      const DropdownMenuItem(value: 'flying', child: Text('Flying')),
      const DropdownMenuItem(value: 'poison', child: Text('Poison')),
      const DropdownMenuItem(value: 'ground', child: Text('Ground')),
      const DropdownMenuItem(value: 'rock', child: Text('Rock')),
      const DropdownMenuItem(value: 'bug', child: Text('Bug')),
      const DropdownMenuItem(value: 'ghost', child: Text('Ghost')),
      const DropdownMenuItem(value: 'steel', child: Text('Steel')),
      const DropdownMenuItem(value: 'fire', child: Text('Fire')),
      const DropdownMenuItem(value: 'water', child: Text('Water')),
      const DropdownMenuItem(value: 'grass', child: Text('Grass')),
      const DropdownMenuItem(value: 'electric', child: Text('Electric')),
      const DropdownMenuItem(value: 'psychic', child: Text('Psychic')),
      const DropdownMenuItem(value: 'ice', child: Text('Ice')),
      const DropdownMenuItem(value: 'dragon', child: Text('Dragon')),
      const DropdownMenuItem(value: 'dark', child: Text('Dark')),
      const DropdownMenuItem(value: 'fairy', child: Text('Fairy')),
    ];
    return menuItems;
  }

  @override
  void initState() {
    super.initState();
    context.read<PokemonStore>().listPokemons();
  }

  void _loadMorePokemons() {
    context.read<PokemonStore>().listPokemons(
          offset: _pokemons.length,
          type: selectedType == 'disable' ? null : selectedType,
        );
  }

  void _searchPokemonByName() {
    context.read<PokemonStore>().searchPokemonByName(searchController.text);
  }

  void _searchPokemonByRandomId() {
    final random = Random().nextInt(905);
    context.read<PokemonStore>().searchPokemonById(random);
  }

  @override
  Widget build(BuildContext context) {
    final store = context.watch<PokemonStore>();
    final state = store.value;

    MediaQueryData queryData = MediaQuery.of(context);

    if (state is LoadingPokemonState) {
      setState(() {
        isLoading = true;
        error = null;
      });
    }

    if (state is LoadingSearchPokemonState) {
      setState(() {
        isLoadingSearch = true;
        error = null;
      });
    }

    if (state is ErrorPokemonState) {
      setState(() {
        isLoading = false;
        isLoadingSearch = false;
        error = state.message;
      });
    }

    if (state is SuccessPokemonState) {
      setState(() {
        isLoading = false;
        isLoadingSearch = false;
        error = null;

        _pokemons = [..._pokemons, ...state.pokemons];
      });
    }

    if (state is SuccessPokemonOnlyState) {
      setState(() {
        isLoadingSearch = false;
        isLoading = false;
        error = null;
      });

      searchController.clear();
      Modular.to.pushReplacementNamed('/detail', arguments: state.pokemon);
    }

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Container(
            color: AppColors.background,
            child: Column(
              children: [
                Container(
                  color: Colors.transparent,
                  width: double.infinity,
                  height: 50,
                  child: Row(
                    children: [
                      Image.asset(
                        AppImages.minPokeball,
                        width: 50,
                        height: 50,
                      ),
                      Text(
                        'Pokédex',
                        style: GoogleFonts.poppins(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: AppColors.darkGray,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(bottom: 10),
                  padding: const EdgeInsets.only(left: 10),
                  height: 30,
                  width: queryData.size.width - 20,
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Stack(
                    alignment: AlignmentDirectional.centerStart,
                    children: [
                      TextField(
                        controller: searchController,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Search by name',
                          hintStyle: AppFonts.searchText,
                        ),
                        style: AppFonts.searchText,
                        onSubmitted: (_) => _searchPokemonByName,
                      ),
                      Positioned(
                        top: -10,
                        right: 10,
                        child: IconButton(
                          onPressed: _searchPokemonByName,
                          icon: const Icon(Icons.search),
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: DropdownButton<String>(
                        value: selectedType,
                        icon: const Icon(Icons.arrow_downward),
                        elevation: 16,
                        onChanged: (String? newValue) {
                          setState(() {
                            selectedType = newValue!;
                            _pokemons = [];
                            _loadMorePokemons();
                          });
                        },
                        items: dropdownItems,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        setState(() {
                          selectedType = "disable";
                          searchController.clear();
                          _pokemons = [];
                          _loadMorePokemons();
                        });
                      },
                      icon: const Icon(Icons.close),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: _searchPokemonByRandomId,
                      child: const Text("Random Pokemon"),
                    ),
                  ],
                ),
                const SizedBox(height: 5),
                Expanded(
                  flex: 1,
                  child: Container(
                    color: Colors.transparent,
                    child: isLoadingSearch
                        ? const Center(
                            child: CircularProgressIndicator(),
                          )
                        : error != null
                            ? Text(error!)
                            : InfiniteScrollGrid(
                                scrollDirection: Axis.vertical,
                                crossAxisSpacing: 5,
                                mainAxisSpacing: 5,
                                crossAxisCount: 3,
                                onLoadingStart: selectedType == 'disable'
                                    ? (_) => _loadMorePokemons()
                                    : null,
                                everythingLoaded: selectedType == 'disable'
                                    ? isLoading
                                    : true,
                                children: _pokemons
                                    .map((pokemon) => PokemonCard(pokemon))
                                    .toList(),
                              ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
