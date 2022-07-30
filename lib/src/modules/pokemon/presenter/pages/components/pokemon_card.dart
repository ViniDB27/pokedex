import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';

import '../../../../../shared/theme/app_colors.dart';
import '../../../../../shared/theme/app_fonts.dart';
import '../../../domain/entities/pokemon_entity.dart';

class PokemonCard extends StatelessWidget {
  final Pokemon pokemon;

  const PokemonCard(
    this.pokemon, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Modular.to.pushReplacementNamed('/detail', arguments: pokemon);
      },
      child: Container(
        width: 110,
        height: 120,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: AppColors.white,
          border: Border.all(
            color: AppColors.types[pokemon.types[0]]!,
            width: 1.0,
            style: BorderStyle.solid,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 5, top: 1),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    "#${pokemon.id.toString().padLeft(3, '0')}",
                    style: TextStyle(
                      fontSize: AppFonts.pokemonNumberHomeCard.fontSize,
                      fontFamily: AppFonts.pokemonNumberHomeCard.fontFamily,
                      fontWeight: AppFonts.pokemonNumberHomeCard.fontWeight,
                      color: AppColors.types[pokemon.types[0]],
                    ),
                  )
                ],
              ),
            ),
            ClipRRect(
              child: Image.network(
                pokemon.image,
                fit: BoxFit.cover,
                width: 70,
                height: 70,
              ),
            ),
            Container(
              width: double.infinity,
              height: 30,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(8),
                  bottomRight: Radius.circular(8),
                ),
                color: AppColors.types[pokemon.types[0]],
              ),
              child: Center(
                child: Text(
                  pokemon.name,
                  style: AppFonts.pokemonNameHomeCard,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
