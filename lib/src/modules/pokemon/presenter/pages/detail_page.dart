import 'package:flutter/material.dart';

import '../../../../shared/theme/app_colors.dart';
import '../../../../shared/theme/app_fonts.dart';
import '../../domain/entities/pokemon_entity.dart';

import 'components/detail_header.dart';
import 'components/detail_pokemon_status.dart';

class PokemonDetailPage extends StatelessWidget {
  final Pokemon pokemon;

  const PokemonDetailPage({
    Key? key,
    required this.pokemon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData = MediaQuery.of(context);

    return Scaffold(
      backgroundColor: AppColors.types[pokemon.types[0]],
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Stack(
            children: [
              Column(
                children: [
                  DetailHeader(pokemon: pokemon),
                  Expanded(
                    flex: 1,
                    child: Container(
                      padding: const EdgeInsets.only(top: 60),
                      decoration: BoxDecoration(
                        color: AppColors.background,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Column(
                        children: [
                          Container(
                            width: double.infinity,
                            height: 50,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: pokemon.types.map((type) {
                                return Container(
                                  decoration: BoxDecoration(
                                    color: AppColors.types[type],
                                    borderRadius: BorderRadius.circular(50),
                                  ),
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 5,
                                    horizontal: 10,
                                  ),
                                  margin: const EdgeInsets.all(5),
                                  child: Text(
                                    type,
                                    style: TextStyle(
                                      fontFamily: AppFonts
                                          .pokemonNameHomeCard.fontFamily,
                                      fontSize: 16,
                                      fontWeight: FontWeight.normal,
                                      color: AppColors.white,
                                    ),
                                  ),
                                );
                              }).toList(),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.only(top: 15),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "About",
                                  style: TextStyle(
                                    fontFamily:
                                        AppFonts.pokemonNameHomeCard.fontFamily,
                                    fontSize: 16,
                                    fontWeight: FontWeight.normal,
                                    color: AppColors.types[pokemon.types[0]],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(top: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Container(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          const Icon(
                                            Icons.keyboard_command_key_rounded,
                                            color: AppColors.darkGray,
                                            size: 16,
                                          ),
                                          Text(
                                            "${pokemon.weight / 10} Kg"
                                                .replaceAll(".", ","),
                                            style: TextStyle(
                                              fontFamily: AppFonts
                                                  .pokemonNameHomeCard
                                                  .fontFamily,
                                              fontSize: 16,
                                              fontWeight: FontWeight.normal,
                                              color: AppColors.darkGray,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Text(
                                        "weight",
                                        style: TextStyle(
                                          fontFamily: AppFonts
                                              .pokemonNameHomeCard.fontFamily,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400,
                                          color: AppColors.mediumGray,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20),
                                  decoration: const BoxDecoration(
                                    border: Border.symmetric(
                                      vertical: BorderSide(
                                        color: AppColors.lightGray,
                                        width: 1,
                                      ),
                                    ),
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          const Icon(
                                            Icons.keyboard_command_key_rounded,
                                            color: AppColors.darkGray,
                                            size: 16,
                                          ),
                                          Text(
                                            "${pokemon.height / 10} m"
                                                .replaceAll(".", ","),
                                            style: TextStyle(
                                              fontFamily: AppFonts
                                                  .pokemonNameHomeCard
                                                  .fontFamily,
                                              fontSize: 16,
                                              fontWeight: FontWeight.normal,
                                              color: AppColors.darkGray,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Text(
                                        "height",
                                        style: TextStyle(
                                          fontFamily: AppFonts
                                              .pokemonNameHomeCard.fontFamily,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400,
                                          color: AppColors.mediumGray,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        pokemon.move,
                                        style: TextStyle(
                                          fontFamily: AppFonts
                                              .pokemonNameHomeCard.fontFamily,
                                          fontSize: 16,
                                          fontWeight: FontWeight.normal,
                                          color: AppColors.darkGray,
                                        ),
                                      ),
                                      Text(
                                        "move",
                                        style: TextStyle(
                                          fontFamily: AppFonts
                                              .pokemonNameHomeCard.fontFamily,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400,
                                          color: AppColors.mediumGray,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(top: 30),
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            width: double.infinity,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "There is a plant seed on its back right from \nthe day this Pokémon is born. \nThe seed slowly grows larger.",
                                  style: TextStyle(
                                    fontFamily:
                                        AppFonts.pokemonNameHomeCard.fontFamily,
                                    fontSize: 12,
                                    fontWeight: FontWeight.normal,
                                    color: AppColors.darkGray,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(top: 10, bottom: 20),
                            width: double.infinity,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Base Stats",
                                  style: TextStyle(
                                    fontFamily:
                                        AppFonts.pokemonNameHomeCard.fontFamily,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.types[pokemon.types[0]],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          DetailPokemonStatus(pokemon: pokemon),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Positioned(
                top: 51,
                left: (queryData.size.width / 2) - 125,
                child: ClipRRect(
                  child: Image.network(
                    pokemon.image,
                    fit: BoxFit.cover,
                    width: 250,
                    height: 250,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
