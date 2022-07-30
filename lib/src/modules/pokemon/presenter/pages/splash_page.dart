import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../shared/theme/app_colors.dart';
import '../../../../shared/theme/app_images.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage>
    with SingleTickerProviderStateMixin {
  late final AnimationController _splashAnimationController;

  late final Animation<double> animationPokebool;

  List<String> types = const [
    "normal",
    "fighting",
    "flying",
    "poison",
    "ground",
    "rock",
    "bug",
    "ghost",
    "steel",
    "fire",
    "water",
    "grass",
    "electric",
    "psychic",
    "ice",
    "dragon",
    "dark",
    "fairy",
  ];

  final int typePosition = Random().nextInt(18);

  Future<void> redirectHome() async {
    await Future.delayed(const Duration(seconds: 5));
    Modular.to.pushReplacementNamed('/home');
  }

  @override
  void initState() {
    super.initState();

    _splashAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),
    );

    _splashAnimationController.addListener(() {
      setState(() {});
    });

    animationPokebool =
        Tween<double>(begin: 0, end: 360).animate(_splashAnimationController);

    _splashAnimationController.repeat();

    redirectHome();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: AppColors.types[types[typePosition]],
        child: Center(
          child: Container(
            color: Colors.transparent,
            width: double.infinity,
            height: 100,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RotationTransition(
                  turns: AlwaysStoppedAnimation(animationPokebool.value / 360),
                  child: Image.asset(
                    AppImages.minPokeball,
                    width: 50,
                    height: 50,
                  ),
                ),
                Text(
                  'Pokédex',
                  style: GoogleFonts.poppins(
                    fontSize: 42,
                    fontWeight: FontWeight.bold,
                    color: AppColors.darkGray,
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
