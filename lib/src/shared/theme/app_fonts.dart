import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import './app_colors.dart';



class AppFonts {
  static final searchText = GoogleFonts.poppins(
    fontSize: 14,
    fontWeight: FontWeight.normal,
    color: AppColors.mediumGray,
  );
  
  static final pokemonNameHomeCard = GoogleFonts.poppins(
    fontWeight: FontWeight.bold,
    fontSize: 16,
    color: AppColors.white,
  );
 
  static final pokemonNumberHomeCard = GoogleFonts.poppins(
    fontWeight: FontWeight.normal,
    fontSize: 10,
  );
}