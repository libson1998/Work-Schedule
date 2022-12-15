import 'package:flutter/material.dart';

CustomTheme currentTheme = CustomTheme();

// to add more custom themes
class CustomTheme with ChangeNotifier {
  static bool _isDarkTheme = false;

  ThemeMode get currentTheme => _isDarkTheme ? ThemeMode.dark : ThemeMode.light;

  void toggleTheme() {
    _isDarkTheme = !_isDarkTheme;
    notifyListeners();
  }

  static ThemeData get lightTheme {
    return ThemeData(
      fontFamily:'OpenSans',
        accentColor: Colors.deepPurpleAccent,
        // backgroundColor: Colors.white,
      primaryColor: Colors.deepPurpleAccent,
        scaffoldBackgroundColor: const Color(0xFFf1fafc),
        // scaffoldBackgroundColor: Colors.indigo.shade50,
        textTheme:  const TextTheme(
          headline1: TextStyle(
            fontSize: 14,
            color: Color(0xFF023047),
            fontWeight: FontWeight.w700,
          ),
          headline2: TextStyle(
            fontSize: 32,
            color: Color(0xFF023047),
            fontWeight: FontWeight.bold,
          ),
          headline3: TextStyle(
            fontSize: 22,
            color: Color(0xFF023047),
            fontWeight: FontWeight.bold,
          ),
          headline4: TextStyle(
            fontSize: 14,
            color: Color(0xFF023047),
            // fontWeight: FontWeight.w700,
          ),
          headline6: TextStyle(
            fontSize: 14,
            color: Colors.black,
            fontWeight: FontWeight.normal,
          ),
          bodyText1: TextStyle(
            fontSize: 16,
            color: Color(0xFF023047),
          ),
          bodyText2: TextStyle(
            fontSize: 14,
            color: Color(0xFF023047),
          ),
          subtitle2: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: Color(0xFF022F3C),
          ),
          caption: TextStyle(
            fontSize: 12,
            color: Color(0xFF022F3C),

          ),
          // subtitle1: TextStyle(
          //   fontSize: 12,
          // ),
        ),
        iconTheme: const IconThemeData(

          size: 24,
          color: Colors.grey,
        ),
        inputDecorationTheme: const InputDecorationTheme(
          border: OutlineInputBorder(),
          contentPadding: EdgeInsets.symmetric(vertical: 8.0),
          labelStyle: TextStyle(fontSize: 12),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xFF2CAAC5)),
          ),
          iconColor: Color(0xFF2CAAC5),
          floatingLabelStyle: TextStyle(
            color: Color(
              0xFF2CAAC5,
            ),
            fontSize: 12,
          ),
        ),
       );
  }

  static ThemeData get darkTheme {
    return ThemeData(
      primarySwatch: Colors.blueGrey,
      primaryColor: Colors.black,
      accentColor: Colors.red,
      backgroundColor: Colors.grey,
      scaffoldBackgroundColor: Colors.grey,
      textTheme: const TextTheme(
        headline1: TextStyle(color: Colors.white),
        headline2: TextStyle(color: Colors.white),
        bodyText1: TextStyle(color: Colors.white),
        bodyText2: TextStyle(color: Colors.white),
      ),
    );
  }
}
