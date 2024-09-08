import 'package:flutter/material.dart';

class CustomThemeMode {
  static final CustomThemeMode instance = CustomThemeMode._internal();
  static ValueNotifier<ThemeMode> themeMode = ValueNotifier(ThemeMode.light);
  static ValueNotifier<bool> current = ValueNotifier(true);
  factory CustomThemeMode() => instance;

  static void change() {
    switch (themeMode.value) {
      case ThemeMode.light:
        themeMode.value = ThemeMode.dark;
        current.value = false;
        break;
      case ThemeMode.dark:
        themeMode.value = ThemeMode.light;
        current.value = true;
        break;
      default:
    }
  }

  CustomThemeMode._internal();
}

class CustomThemeData {
  static final ThemeData light = ThemeData(
    textTheme: textTheme.copyWith(
      titleLarge: textTheme.titleLarge?.copyWith(color: const Color(0xFF4E4E4E)), // Light mode 'Speed' 텍스트 스타일
    ),
    scaffoldBackgroundColor: const Color(0xFFE3E3E3),
    appBarTheme: const AppBarTheme(
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(const Color(0xFFE9E9E9)),
        foregroundColor: MaterialStateProperty.all<Color>(const Color(0xFF4E4E4E)),
        textStyle: MaterialStateProperty.all<TextStyle>(
          const TextStyle(
            fontSize: 30,
          ),
        ),
      ),
    ),
  );

  static final ThemeData dark = ThemeData(
    textTheme: textTheme.copyWith(
      titleLarge: textTheme.titleLarge?.copyWith(color: const Color(0xFFE0E4EB)), // Dark mode 'Speed' 텍스트 스타일
    ),
    scaffoldBackgroundColor: const Color(0xFF464646),
    appBarTheme: const AppBarTheme(
      // backgroundColor: const Color.fromRGBO(51, 51, 51, 1),
      // titleTextStyle: textTheme.headline1?.copyWith(color: Colors.deepOrange),
      // iconTheme: const IconThemeData(color: Colors.deepOrange),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      // backgroundColor: Color.fromRGBO(41, 41, 41, 1),
      // selectedItemColor: Colors.deepOrange,
      // unselectedItemColor: Colors.white,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(const Color(0xFF656565)),
      ),
    ),
  );

  static const TextTheme textTheme = TextTheme(
    titleLarge: TextStyle(fontSize: 27, // 글자,
                          fontWeight: FontWeight.bold), // 기본 titleLarge 스타일
  );
}

// Extension to ThemeData for accessing button colors based on isActive and themeMode
extension ButtonColorExtension on ThemeData {
  Color getButtonColor(bool isActive, ThemeMode themeMode) {
    if (themeMode == ThemeMode.light) {
      return isActive ? const Color(0xFF7882DE) : const Color(0xFFE9E9E9);
    } else {
      return isActive ? const Color(0xFF7882DE) : const Color(0xFF656565);
    }
  }
  // 글씨 색상을 반환하는 메서드 추가
  Color getTextColor(bool isActive, ThemeMode themeMode) {
    if (themeMode == ThemeMode.light) {
      return isActive ? const Color(0xFFF6F6F6) : const Color(0xFF4E4E4E);
    } else {
      return isActive ? const Color(0xFFF6F6F6) : const Color(0xFFF6F6F6);
    }
  }
}