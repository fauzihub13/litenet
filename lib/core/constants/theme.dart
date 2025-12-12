
import 'package:flutter/material.dart';


class FontSize {
  static const h1 = 31.0;
  static const h2 = 25.0;
  static const h3 = 20.0;
  static const body = 16.0;
  static const caption = 13.0;
}

class PaddingSize {
  static const horizontal = 18.0;
  static const vertical = 18.0;
}

class DefaultColors {

  // =========== BLACK ===========
  static const black50 = Color(0xffe6e6ec);
  static const black100 = Color(0xffb3b0c4);
  static const black200 = Color(0xff8e8aa7);
  static const black300 = Color(0xff5a547f);
  static const black400 = Color(0xff3a3366);
  static const black500 = Color(0xff090040);
  static const black600 = Color(0xff08003a);
  static const black700 = Color(0xff06002d);
  static const black800 = Color(0xff050023);
  static const black900 = Color(0xff04001b);

  // =========== PURPLE ===========
  static const purple50 = Color(0xffefecff);
  static const purple100 = Color(0xffcdc5fe);
  static const purple200 = Color(0xffb5a9fe);
  static const purple300 = Color(0xff9482fe);
  static const purple400 = Color(0xff7f6afd);
  static const purple500 = Color(0xff5f45fd);
  static const purple600 = Color(0xff563fe6);
  static const purple700 = Color(0xff4331b4);
  static const purple800 = Color(0xff34268b);
  static const purple900 = Color(0xff281d6a);

  // =========== BASE ===========
  static const lightRed = Color(0xffFF383C);
  static const lightYellow = Color(0xffFFCC00);
  static const black = Color(0xff090040);
  
}


class AppTheme {
  static ThemeData get light {
    return ThemeData(
      useMaterial3: true,
      scaffoldBackgroundColor: Colors.white,
      fontFamily: 'Montserrat',
      textTheme: TextTheme(
        titleLarge: TextStyle(
          fontSize: FontSize.h1,
          color: DefaultColors.black,
        ),
        titleMedium: TextStyle(
          fontSize: FontSize.h2,
          color: DefaultColors.black,
        ),
        bodyLarge: TextStyle(
          fontSize: FontSize.h3,
          color: DefaultColors.black,
        ),
        bodyMedium: TextStyle(
          fontSize: FontSize.body,
          color: DefaultColors.black,
        ),
        bodySmall: TextStyle(
          fontSize: FontSize.caption,
          color: DefaultColors.black,
        ),
      ),
      textSelectionTheme: TextSelectionThemeData(
        cursorColor: DefaultColors.purple500,
        selectionColor: DefaultColors.purple100,
        selectionHandleColor: DefaultColors.purple500,
      ),

      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: Colors.white,
        labelStyle: TextStyle(color: DefaultColors.purple200),
        hintStyle: TextStyle(
          fontSize: FontSize.body,
          color: DefaultColors.purple200,
        ),
        iconColor: DefaultColors.purple200,
        suffixIconColor: DefaultColors.purple200,
        prefixIconColor: DefaultColors.purple200,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: BorderSide(color: DefaultColors.purple50, width: 1.5),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: BorderSide(color: DefaultColors.purple50, width: 1.5),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: BorderSide(color: DefaultColors.purple50, width: 1.5),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: BorderSide(color: DefaultColors.purple500, width: 1.5),
        ),
      ),
      iconTheme: IconThemeData(color: DefaultColors.purple200),
      buttonTheme: ButtonThemeData(buttonColor: DefaultColors.purple500),
      dialogTheme: DialogThemeData(backgroundColor: Colors.white),
      tabBarTheme: TabBarThemeData(
        splashFactory: InkRipple.splashFactory,
        overlayColor: WidgetStateProperty.resolveWith<Color?>((
          Set<WidgetState> states,
        ) {
          return states.contains(WidgetState.focused)
              ? null
              : DefaultColors.purple200;
        }),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          minimumSize: Size(0, 0),
        ),
      ),
    );
  }
}
