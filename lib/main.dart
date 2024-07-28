import 'package:flash/ui/FlashUI.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import '../../../global/ScreenSize.dart';
import '../../../theme/theme.dart';

void main() {
  CustomThemeMode.instance;
  CustomThemeMode.themeMode.value =
      ThemeMode.light; // Ensure light mode is set initially
  // CustomThemeMode.themeMode.value = ThemeMode.dark; // Ensure dark mode is set initially
  runApp(const FlashApp());
}

class FlashApp extends StatefulWidget {
  const FlashApp({super.key});

  @override
  State<FlashApp> createState() => _FlashState();
}

class _FlashState extends State<FlashApp> {
  late Future<InitializationStatus> _initStatus;
  BannerAd? _bannerAd;
  bool _isAdLoaded = false;

  @override
  void initState() {
    super.initState();
    _initStatus = MobileAds.instance.initialize();
    _initStatus.then((status) {
      print('Initialization status: $status');
      // 테스트 디바이스 설정
      final RequestConfiguration configuration = RequestConfiguration(
        testDeviceIds: ["6CDEBCFFC60F4378CB7601EC6E2F8585"],
      );
      MobileAds.instance.updateRequestConfiguration(configuration);
      _loadBannerAd();
    }).catchError((error) {
      print('Initialization failed: $error');
    });
  }

  void _loadBannerAd() {
    _bannerAd = BannerAd(
      adUnitId: 'ca-app-pub-3940256099942544/6300978111',
      request: const AdRequest(),
      size: AdSize.banner,
      listener: BannerAdListener(onAdLoaded: (Ad ad) {
        setState(() {
          _isAdLoaded = true;
        });
      }, onAdFailedToLoad: (Ad ad, LoadAdError error) {
        ad.dispose();
        print('Ad failed to load: $error');
        ad.dispose();
      }),
    )..load();
  }

  @override
  void dispose() {
    _bannerAd?.dispose();
    super.dispose();
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
            bottomNavigationBar: _isAdLoaded
                ? Container(
                    color: mode == ThemeMode.light
                        ? Color(
                            0xFFD9D9D9) // Light mode bottom navigation bar color
                        : Color(
                            0xFFD9D9D9), // Dark mode bottom navigation bar color
                    height: 60,
                    child: AdWidget(ad: _bannerAd!),
                  )
                : const SizedBox.shrink(),
          ),
        );
      },
    );
  }
}
