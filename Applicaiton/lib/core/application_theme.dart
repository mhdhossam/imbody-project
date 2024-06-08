import 'package:flutter/material.dart';

class ApplicationTheme {
  //light theme colors
  static const Color gothic = Color(0xff254c51);
  static const Color openGothic = Color(0xff6c8589);
  static const Color whiteGothic = Color(0xffcedcdd);
  static const Color white = Color(0xffffffff);
  static const Color darkSlate = Color(0xff000c08);
  //dark theme colors
  static const Color gothicShade = Color(0xff254c51);
  static const Color openGothicShade = Color(0xff4d6467);
  static const Color whiteGothicShade = Color(0xffaebdbd);
  static const Color darkDarkSlate = Color(0xff191919);
  static const Color darkSlateAccent = Color(0xff001a11);
  static const Color darkBackGround = Color(0xff203e41);

  static final ThemeData lightTheme = ThemeData(
    primaryColor: gothic,
    secondaryHeaderColor: gothic,
    scaffoldBackgroundColor: openGothic,
    appBarTheme: const AppBarTheme(
      backgroundColor: gothic,
      elevation: 5,
      centerTitle: true,
      iconTheme: IconThemeData(
        color: white,
        size: 30,
      ),
      titleTextStyle: TextStyle(
        color: white,
        fontSize: 34,
        fontWeight: FontWeight.bold,
      ),

    ),

    textTheme: const TextTheme(
      titleLarge: TextStyle(
        color: white,
        fontSize: 28,
        fontWeight: FontWeight.bold,
      ),
      bodyLarge: TextStyle(
        color: white,
        fontSize: 24,
        fontWeight: FontWeight.bold,

      ),
      titleMedium: TextStyle(
        color: white,
        fontSize: 21,
        fontWeight: FontWeight.bold,
      ),
      bodyMedium: TextStyle(
        color: white,
        fontSize: 18,
        fontWeight: FontWeight.normal,
      ),
      bodySmall: TextStyle(
        color: white,
        fontSize: 14,
        fontWeight: FontWeight.normal,
      )
    ),
    colorScheme: const ColorScheme(
        primary: gothic,
        onPrimary: openGothic,
        secondary: whiteGothic,
        onSecondary: white,
        error: Colors.red,
        onError: Colors.red,
        background: Colors.white,
        onBackground: Colors.white,
        surface: Colors.blue,
        onSurface: Colors.white,
        brightness: Brightness.dark
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: gothic,
      type: BottomNavigationBarType.fixed,
      elevation: 0,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.white,
      selectedIconTheme: IconThemeData(
        color: Colors.black,
      ),
    ),
    bottomSheetTheme:  const BottomSheetThemeData(
      showDragHandle: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(40),
          topRight: Radius.circular(40),
        ),
      ),
      elevation: 0,
      modalElevation: 0,
      backgroundColor: openGothic,
    ),
  );
  static final ThemeData darkTheme = ThemeData(
    primaryColor: gothicShade,
    secondaryHeaderColor: openGothicShade,
    scaffoldBackgroundColor: darkBackGround.withOpacity(0.8),
    appBarTheme: const AppBarTheme(
      backgroundColor: darkBackGround,
      elevation: 0,
      centerTitle: true,
      iconTheme: IconThemeData(
        color: white,
        size: 30,
      ),
      titleTextStyle: TextStyle(
        color: white,
        fontSize: 34,
        fontWeight: FontWeight.bold,
      ),
    ),
    textTheme: const TextTheme(
        titleLarge: TextStyle(
          color: white,
          fontSize: 28,
          fontWeight: FontWeight.bold,
        ),
        bodyLarge: TextStyle(
          color: white,
          fontSize: 24,
          fontWeight: FontWeight.bold,

        ),
        titleMedium: TextStyle(
          color: white,
          fontSize: 21,
          fontWeight: FontWeight.bold,
        ),
        bodyMedium: TextStyle(
          color: white,
          fontSize: 18,
          fontWeight: FontWeight.normal,
        ),
        bodySmall: TextStyle(
          color: white,
          fontSize: 14,
          fontWeight: FontWeight.normal,
        )
    ),
    colorScheme: const ColorScheme(
        primary: gothicShade,
        onPrimary: openGothicShade,
        secondary: whiteGothicShade,
        onSecondary: white,
        error: Colors.red,
        onError: Colors.red,
        background:whiteGothicShade ,
        onBackground: Colors.white,
        surface: Colors.blue,
        onSurface: Colors.white,
        brightness: Brightness.dark
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      elevation: 0,
      backgroundColor: gothicShade,
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.white54,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      selectedIconTheme: IconThemeData(
        color: Colors.black,
      ),
    ),
    bottomSheetTheme:  const BottomSheetThemeData(
      showDragHandle: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(40),
          topRight: Radius.circular(40),
        ),
      ),
      elevation: 0,
      modalElevation: 0,
      backgroundColor: darkBackGround,
    ),
  );
}
