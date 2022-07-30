import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../../shared/theme/app_colors.dart';
import '../../../../../shared/theme/app_fonts.dart';
import '../../../../../shared/theme/app_images.dart';
import '../../../domain/entities/pokemon_entity.dart';

class DetailHeader extends StatelessWidget {
  const DetailHeader({
    Key? key,
    required this.pokemon,
  }) : super(key: key);

  final Pokemon pokemon;

  goBack() {
    Modular.to.pop();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.transparent,
      ),
      height: 230,
      child: Stack(
        children: [
          Positioned(
            top: 10,
            right: 10,
            child: Image.asset(
              AppImages.pokeball,
              width: 200,
              height: 200,
            ),
          ),
          Container(
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.only(right: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    child: Row(
                      children: [
                        IconButton(
                          onPressed: goBack,
                          icon: const Icon(
                            Icons.arrow_back,
                            color: AppColors.white,
                          ),
                        ),
                        Text(
                          pokemon.name,
                          style: TextStyle(
                            fontFamily: AppFonts.pokemonNameHomeCard.fontFamily,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: AppColors.white,
                          ),
                        )
                      ],
                    ),
                  ),
                  Text(
                    "#${pokemon.id.toString().padLeft(3, '0')}",
                    style: TextStyle(
                      fontFamily: AppFonts.pokemonNameHomeCard.fontFamily,
                      fontSize: 16,
                      fontWeight: FontWeight.normal,
                      color: AppColors.white,
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
