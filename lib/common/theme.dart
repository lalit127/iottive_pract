import 'package:iottive_pract/config/app_colors.dart';
import 'package:iottive_pract/gen/fonts.gen.dart';
import 'package:flutter/material.dart';

class AppThemes {
  static final ThemeData lightTheme = ThemeData(
    textSelectionTheme: TextSelectionThemeData(
      cursorColor: AppColors.primaryColor,
      selectionColor: AppColors.primaryColor.withOpacity(0.5),
      selectionHandleColor: AppColors.primaryColor,
    ),
    splashColor: Colors.transparent,
    highlightColor: Colors.transparent,
    splashFactory: NoSplash.splashFactory,
    scaffoldBackgroundColor: AppColors.backgroundLight,
    scrollbarTheme: ScrollbarThemeData().copyWith(
      thumbColor: MaterialStateProperty.all(AppColors.primaryColor),
    ),
    dividerColor: AppColors.grayDark,
    dialogBackgroundColor: AppColors.backgroundLight,
    canvasColor: AppColors.backgroundLight,
    primaryColor: AppColors.primaryColor,
    fontFamily: FontFamily.helixRegular,
    cardColor: AppColors.whiteOff,
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
      isDense: true,
      fillColor: AppColors.grayDark,
      filled: false,
      disabledBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: AppColors.grayLight),
      ),
      enabledBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: AppColors.grayLight),
      ),
      focusedBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: AppColors.grayLight),
      ),
    ),
    colorScheme: ColorScheme.light(
      primary: AppColors.whiteOff,
      background: AppColors.whiteOff,
      surface: AppColors.whiteOff,
      onBackground: AppColors.whiteOff,
    ),
    appBarTheme: AppBarTheme(
      shadowColor: AppColors.primaryColor,
      color: AppColors.whiteOff,
      elevation: 0,
      iconTheme: IconThemeData(color: AppColors.primaryColor),
      titleTextStyle: TextStyle(
        color: AppColors.grayDark,
        fontSize: 18,
        fontWeight: FontWeight.w600,
      ),
    ),
    textTheme: TextTheme(
      bodySmall: TextStyle(
        fontSize: 10,
        fontWeight: FontWeight.w400,
        color: AppColors.grayDark,
        fontFamily: FontFamily.helixRegular,
        letterSpacing: 0.6,
      ),
      bodyMedium: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w400,
        color: AppColors.grayDark,
        fontFamily: FontFamily.helixRegular,
        letterSpacing: 0.6,
      ),
      bodyLarge: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: AppColors.grayDark,
        fontFamily: FontFamily.helixRegular,
        letterSpacing: 0.6,
      ),
      titleMedium: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w400,
        color: AppColors.grayDark,
        fontFamily: FontFamily.helixRegular,
        letterSpacing: 0.6,
      ),
      headlineMedium: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w400,
        color: AppColors.grayDark,
        fontFamily: FontFamily.helixRegular,
        letterSpacing: 0.6,
      ),
      displaySmall: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.w700,
        color: AppColors.black,
        fontFamily: FontFamily.helixRegular,
        letterSpacing: 0.6,
      ),
      displayMedium: TextStyle(
        fontSize: 28,
        fontWeight: FontWeight.w400,
        color: AppColors.grayDark,
        fontFamily: FontFamily.helixRegular,
        letterSpacing: 0.6,
      ),
      displayLarge: TextStyle(
        fontSize: 32,
        fontWeight: FontWeight.w700,
        color: AppColors.black,
        fontFamily: FontFamily.helixRegular,
        letterSpacing: 0.6,
      ),
    ),
    iconTheme: IconThemeData(color: AppColors.primaryColor),
    cardTheme: CardTheme(
      elevation: 5,
      color: AppColors.backgroundLight,
      shadowColor: AppColors.primaryColor.withOpacity(0.5),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        backgroundColor: AppColors.primaryColor,
        foregroundColor: AppColors.whiteOff,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        elevation: 0,
        backgroundColor: AppColors.primaryColor,
        foregroundColor: AppColors.whiteOff,
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        backgroundColor: AppColors.primaryColor,
        foregroundColor: AppColors.whiteOff,
      ),
    ),
    snackBarTheme: SnackBarThemeData(
      backgroundColor: AppColors.primaryColor,
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(3)),
    ),
    bottomSheetTheme: BottomSheetThemeData(
      backgroundColor: AppColors.whiteOff,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(8)),
      ),
    ),
    bottomAppBarTheme: BottomAppBarTheme(color: AppColors.whiteOff),
    tabBarTheme: TabBarTheme(
      labelColor: AppColors.whiteOff,
      unselectedLabelColor: AppColors.primaryColor,
      indicator: ShapeDecoration(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
        color: AppColors.primaryColor,
      ),
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: AppColors.primaryColor,
      foregroundColor: AppColors.grayLight,
    ),
  );

  // Dark Theme
  static final ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.black,
    scrollbarTheme: ScrollbarThemeData().copyWith(
      thumbColor: MaterialStateProperty.all(AppColors.primaryColor),
    ),
    textSelectionTheme: TextSelectionThemeData(
      cursorColor: AppColors.primaryColor,
      selectionColor: AppColors.primaryColor.withOpacity(0.5),
      selectionHandleColor: AppColors.primaryColor,
    ),
    splashColor: Colors.transparent,
    highlightColor: Colors.transparent,
    splashFactory: NoSplash.splashFactory,
    primaryColor: AppColors.primaryColor,
    cardColor: AppColors.whiteOff,
    dividerColor: AppColors.grayDark,
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
      isDense: true,
      fillColor: AppColors.grayDark,
      filled: false,
      disabledBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: AppColors.grayLight),
      ),
      enabledBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: AppColors.grayLight),
      ),
      focusedBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: AppColors.grayLight),
      ),
    ),
    colorScheme: ColorScheme.light(
      primary: AppColors.backgroundLight,
      background: AppColors.backgroundDark,
      surface: AppColors.grayLight,
      onBackground: AppColors.whiteOff,
    ),
    appBarTheme: AppBarTheme(
      shadowColor: AppColors.primaryColor,
      color: AppColors.whiteOff,
      elevation: 0,
      iconTheme: IconThemeData(color: AppColors.primaryColor),
      titleTextStyle: TextStyle(
        color: AppColors.whiteOff,
        fontSize: 18,
        fontWeight: FontWeight.w600,
      ),
    ),
    textTheme: TextTheme(
      bodySmall: TextStyle(
        fontSize: 10,
        fontWeight: FontWeight.w400,
        color: AppColors.grayLight,
        fontFamily: FontFamily.helixRegular,
        letterSpacing: 0.6,
      ),
      bodyMedium: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w400,
        color: AppColors.grayLight,
        fontFamily: FontFamily.helixRegular,
        letterSpacing: 0.6,
      ),
      bodyLarge: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: AppColors.grayLight,
        fontFamily: FontFamily.helixRegular,
        letterSpacing: 0.6,
      ),
      titleMedium: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w400,
        color: AppColors.grayLight,
        fontFamily: FontFamily.helixRegular,
        letterSpacing: 0.6,
      ),
      headlineMedium: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w400,
        color: AppColors.grayLight,
        fontFamily: FontFamily.helixRegular,
        letterSpacing: 0.6,
      ),
      displaySmall: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.w700,
        color: AppColors.grayLight,
        fontFamily: FontFamily.helixRegular,
        letterSpacing: 0.6,
      ),
      displayMedium: TextStyle(
        fontSize: 28,
        fontWeight: FontWeight.w400,
        color: AppColors.grayLight,
        fontFamily: FontFamily.helixRegular,
        letterSpacing: 0.6,
      ),
      displayLarge: TextStyle(
        fontSize: 32,
        fontWeight: FontWeight.w700,
        color: AppColors.grayLight,
        fontFamily: FontFamily.helixRegular,
        letterSpacing: 0.6,
      ),
    ),
    iconTheme: IconThemeData(color: AppColors.primaryColor),
    cardTheme: CardTheme(
      elevation: 5,
      color: AppColors.backgroundDark,
      shadowColor: AppColors.primaryColor.withOpacity(0.5),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        backgroundColor: AppColors.primaryColor,
        foregroundColor: AppColors.whiteOff,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        elevation: 0,
        backgroundColor: AppColors.primaryColor,
        foregroundColor: AppColors.whiteOff,
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        backgroundColor: AppColors.primaryColor,
        foregroundColor: AppColors.whiteOff,
      ),
    ),
    snackBarTheme: SnackBarThemeData(
      backgroundColor: AppColors.primaryColor,
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(3)),
    ),
    bottomSheetTheme: BottomSheetThemeData(
      backgroundColor: AppColors.backgroundLight,
    ),
    bottomAppBarTheme: BottomAppBarTheme(color: AppColors.whiteOff),
    tabBarTheme: TabBarTheme(
      labelColor: AppColors.whiteOff,
      unselectedLabelColor: AppColors.primaryColor,
      indicator: ShapeDecoration(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
        color: AppColors.primaryColor,
      ),
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: AppColors.primaryColor,
      foregroundColor: AppColors.grayLight,
    ),
  );
}
