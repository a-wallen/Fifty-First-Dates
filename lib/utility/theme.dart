import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';

final Color primaryColor = Colors.pink;
final Color secondaryColor = Colors.deepPurple;

ThemeData fiftyFirstDatesTheme() {
  TextTheme _basicText(TextTheme base) {
    return base.copyWith(
        headline1: base.headline1.copyWith(color: Colors.white, fontSize: 24),
        subtitle1: base.subtitle1.copyWith(
          color: Colors.white,
          fontSize: 12,
        ));
  }

  AppBarTheme _appbarTheme(AppBarTheme base) {
    return base.copyWith(
      centerTitle: true,
      elevation: 0,
      color: Colors.transparent,
    );
  }

  FloatingActionButtonThemeData _floatingActionButtonTheme(
      FloatingActionButtonThemeData base) {
    return base.copyWith(
      backgroundColor: Colors.white,
      foregroundColor: primaryColor,
      splashColor: secondaryColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
    );
  }

  final ThemeData base = ThemeData.light();
  return base.copyWith(
    textTheme: _basicText(base.textTheme),
    appBarTheme: _appbarTheme(base.appBarTheme),
    floatingActionButtonTheme:
        _floatingActionButtonTheme(base.floatingActionButtonTheme),
  );
}
