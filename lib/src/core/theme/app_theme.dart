import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_app_demo/src/core/utils/color.dart';

var darkTheme =ThemeData(
  scaffoldBackgroundColor:kBackgroundColor,
  primaryColor: kPrimaryColor,
  useMaterial3: true,

  textTheme: TextTheme(
    titleLarge: GoogleFonts.poppins(
      fontSize: 32,
      fontWeight: FontWeight.w700,
      color: kTextColor,
    ),
    titleMedium: GoogleFonts.poppins(
      color:kTextColor,
      fontSize: 22,
      fontWeight: FontWeight.w500,
    ),
    titleSmall: GoogleFonts.poppins(
      color:kTextColor,
      fontSize: 14,
      fontWeight: FontWeight.w400,
    ),
    displayLarge:GoogleFonts.poppins(
      fontSize: 32,
      fontWeight: FontWeight.w700,
      color: kTextColor,
    ),
    displayMedium: GoogleFonts.poppins(
      color:kTextColor,
      fontSize: 22,
      fontWeight: FontWeight.w500,
    ),
    displaySmall: GoogleFonts.poppins(
      color:kTextColor,
      fontSize: 14,
      fontWeight: FontWeight.w400,
    ),

  ),

  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: kGreyColor,
    iconSize: 35,
    elevation: 0,
    foregroundColor: Colors.red,

  ),

  tabBarTheme: TabBarTheme(
    dividerHeight: 0,
    indicatorSize: TabBarIndicatorSize.label,
    indicatorColor: kBackgroundColor,
  ),

  appBarTheme:  AppBarTheme(
    surfaceTintColor: Colors.transparent,
    backgroundColor: Colors.transparent,
    titleTextStyle: GoogleFonts.poppins(
      color:kTextColor,
      fontSize: 22,
      fontWeight: FontWeight.w500,
    ),
    elevation: 0,
    iconTheme: const IconThemeData(
      color: kTextColor,
    ),

  ),

  textButtonTheme: TextButtonThemeData(
    style: ButtonStyle(
      textStyle: MaterialStateProperty.all(
        GoogleFonts.poppins(
          color:kTextColor,
          fontSize: 18,
          fontWeight: FontWeight.w400,
        )

      ),
      foregroundColor: MaterialStateProperty.all(kSecondaryColor),

    )
  ),
  elevatedButtonTheme: const ElevatedButtonThemeData(

  )

);