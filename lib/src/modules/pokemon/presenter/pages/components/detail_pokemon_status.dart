
import 'package:flutter/material.dart';

import '../../../../../shared/theme/app_colors.dart';
import '../../../../../shared/theme/app_fonts.dart';
import '../../../domain/entities/pokemon_entity.dart';

class DetailPokemonStatus extends StatelessWidget {
  const DetailPokemonStatus({
    Key? key,
    required this.pokemon,
  }) : super(key: key);

  final Pokemon pokemon;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.only(right: 20),
            decoration: const BoxDecoration(
              border: Border(
                right: BorderSide(
                  color: AppColors.lightGray,
                ),
              ),
            ),
            child: Column(
              children: [
                Text(
                  "HP",
                  style: TextStyle(
                    fontFamily: AppFonts
                        .pokemonNameHomeCard.fontFamily,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color:
                        AppColors.types[pokemon.types[0]],
                  ),
                ),
                Text(
                  "ATK",
                  style: TextStyle(
                    fontFamily: AppFonts
                        .pokemonNameHomeCard.fontFamily,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color:
                        AppColors.types[pokemon.types[0]],
                  ),
                ),
                Text(
                  "DEF",
                  style: TextStyle(
                    fontFamily: AppFonts
                        .pokemonNameHomeCard.fontFamily,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color:
                        AppColors.types[pokemon.types[0]],
                  ),
                ),
                Text(
                  "SATK",
                  style: TextStyle(
                    fontFamily: AppFonts
                        .pokemonNameHomeCard.fontFamily,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color:
                        AppColors.types[pokemon.types[0]],
                  ),
                ),
                Text(
                  "SDEF",
                  style: TextStyle(
                    fontFamily: AppFonts
                        .pokemonNameHomeCard.fontFamily,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color:
                        AppColors.types[pokemon.types[0]],
                  ),
                ),
                Text(
                  "SPD",
                  style: TextStyle(
                    fontFamily: AppFonts
                        .pokemonNameHomeCard.fontFamily,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color:
                        AppColors.types[pokemon.types[0]],
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 150,
            padding: const EdgeInsets.only(left: 20),
            child: Column(
              mainAxisAlignment:
                  MainAxisAlignment.spaceAround,
              children: [
                Row(
                  children: [
                    Text(pokemon.status.life.toString()),
                    Container(
                      margin:
                          const EdgeInsets.only(left: 10),
                      width: 180,
                      height: 4,
                      decoration: BoxDecoration(
                        color: AppColors
                            .types[pokemon.types[0]]!
                            .withAlpha(150),
                        borderRadius:
                            BorderRadius.circular(10),
                      ),
                      child: Row(
                        mainAxisAlignment:
                            MainAxisAlignment.start,
                        children: [
                          Container(
                            height: 4,
                            width: (pokemon.status.life *
                                    100) /
                                180,
                            decoration: BoxDecoration(
                              color: AppColors.types[
                                  pokemon.types[0]],
                              borderRadius:
                                  BorderRadius.circular(
                                      10),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                        pokemon.status.attack.toString()),
                    Container(
                      margin:
                          const EdgeInsets.only(left: 10),
                      width: 180,
                      height: 4,
                      decoration: BoxDecoration(
                        color: AppColors
                            .types[pokemon.types[0]]!
                            .withAlpha(150),
                        borderRadius:
                            BorderRadius.circular(10),
                      ),
                      child: Row(
                        mainAxisAlignment:
                            MainAxisAlignment.start,
                        children: [
                          Container(
                            height: 4,
                            width:
                                (pokemon.status.attack *
                                        100) /
                                    180,
                            decoration: BoxDecoration(
                              color: AppColors.types[
                                  pokemon.types[0]],
                              borderRadius:
                                  BorderRadius.circular(
                                      10),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(pokemon.status.defense
                        .toString()),
                    Container(
                      margin:
                          const EdgeInsets.only(left: 10),
                      width: 180,
                      height: 4,
                      decoration: BoxDecoration(
                        color: AppColors
                            .types[pokemon.types[0]]!
                            .withAlpha(150),
                        borderRadius:
                            BorderRadius.circular(10),
                      ),
                      child: Row(
                        mainAxisAlignment:
                            MainAxisAlignment.start,
                        children: [
                          Container(
                            height: 4,
                            width:
                                (pokemon.status.defense *
                                        100) /
                                    180,
                            decoration: BoxDecoration(
                              color: AppColors.types[
                                  pokemon.types[0]],
                              borderRadius:
                                  BorderRadius.circular(
                                      10),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(pokemon.status.special_attack
                        .toString()),
                    Container(
                      margin:
                          const EdgeInsets.only(left: 10),
                      width: 180,
                      height: 4,
                      decoration: BoxDecoration(
                        color: AppColors
                            .types[pokemon.types[0]]!
                            .withAlpha(150),
                        borderRadius:
                            BorderRadius.circular(10),
                      ),
                      child: Row(
                        mainAxisAlignment:
                            MainAxisAlignment.start,
                        children: [
                          Container(
                            height: 4,
                            width: (pokemon.status
                                        .special_attack *
                                    100) /
                                180,
                            decoration: BoxDecoration(
                              color: AppColors.types[
                                  pokemon.types[0]],
                              borderRadius:
                                  BorderRadius.circular(
                                      10),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(pokemon.status.special_defense
                        .toString()),
                    Container(
                      margin:
                          const EdgeInsets.only(left: 10),
                      width: 180,
                      height: 4,
                      decoration: BoxDecoration(
                        color: AppColors
                            .types[pokemon.types[0]]!
                            .withAlpha(150),
                        borderRadius:
                            BorderRadius.circular(10),
                      ),
                      child: Row(
                        mainAxisAlignment:
                            MainAxisAlignment.start,
                        children: [
                          Container(
                            height: 4,
                            width: (pokemon.status
                                        .special_defense *
                                    100) /
                                180,
                            decoration: BoxDecoration(
                              color: AppColors.types[
                                  pokemon.types[0]],
                              borderRadius:
                                  BorderRadius.circular(
                                      10),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(pokemon.status.speed.toString()),
                    Container(
                      margin:
                          const EdgeInsets.only(left: 10),
                      width: 180,
                      height: 4,
                      decoration: BoxDecoration(
                        color: AppColors
                            .types[pokemon.types[0]]!
                            .withAlpha(150),
                        borderRadius:
                            BorderRadius.circular(10),
                      ),
                      child: Row(
                        mainAxisAlignment:
                            MainAxisAlignment.start,
                        children: [
                          Container(
                            height: 4,
                            width: (pokemon.status.speed *
                                    100) /
                                180,
                            decoration: BoxDecoration(
                              color: AppColors.types[
                                  pokemon.types[0]],
                              borderRadius:
                                  BorderRadius.circular(
                                      10),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
