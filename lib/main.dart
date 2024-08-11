import 'package:flash/ui/FlashUI.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'dart:ui';  // PlatformDispatcher 사용을 위해 추가
import '../../../global/ScreenSize.dart';
import '../../../theme/theme.dart';

void main() {
  // Get the current system brightness (light or dark)
// Get the current system brightness (light or dark) using PlatformDispatcher
  final Brightness systemBrightness = PlatformDispatcher.instance.platformBrightness;

  // Set the initial theme mode based on the system's brightness
  CustomThemeMode.instance;
  CustomThemeMode.themeMode.value =
  systemBrightness == Brightness.light ? ThemeMode.light : ThemeMode.dark;

  runApp(const FlashApp());
}

class FlashApp extends StatefulWidget {
  const FlashApp({super.key});

  @override
  State<FlashApp> createState() => _FlashState();
}

class _FlashState extends State<FlashApp> {
  late Future<InitializationStatus> _initStatus;

  @override
  void initState() {
    super.initState();
    _initStatus = MobileAds.instance.initialize();
    _initStatus.then((status) {
      print('Initialization status: $status');
    }).catchError((error) {
      print('Initialization failed: $error');
    });
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ThemeMode>(
      valueListenable: CustomThemeMode.themeMode,
      builder: (context, mode, child) {
        ScreenSize.init(context); // 화면 크기 초기화
        return MaterialApp(
          darkTheme: CustomThemeData.dark,
          theme: CustomThemeData.light,
          themeMode: mode,
          home: Scaffold(
            body: Stack(
              children: [
                FlashUI(),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: Container(
                    height: 33 * ScreenSize.scaleWidth(context),
                    child: Text(
                      'ⓒ 2024. illegirls. All rights reserved.',
                      style: TextStyle(
                        color: mode == ThemeMode.light
                            ? Color(0xFF757575)
                            : Color(0xFFFFFFFF), // 라이트 모드와 다크 모드에 따른 색상 변경
                        fontSize: 17 * ScreenSize.scaleWidth(context), // 글자 크기
                      ),
                    ),
                  ),
                ),
              ],
            ),
            bottomNavigationBar: BottomAppBar(
              color: mode == ThemeMode.light
                  ? Color(0xFFD9D9D9) // Light mode bottom navigation bar color
                  : Color(0xFFD9D9D9), // Dark mode bottom navigation bar color
              height: 60,
              child: Center(
                child: Text('Advertisement'),
              ),
            ),
          ),
        );
      },
    );
  }
}
