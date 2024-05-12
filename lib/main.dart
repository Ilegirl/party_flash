import 'package:flash/ui/FlashUI.dart';
import 'package:flutter/material.dart';
import '../../../global/ScreenSize.dart';

void main() {
  runApp(const FlashApp());
}

class FlashApp extends StatefulWidget {
  const FlashApp({super.key});
  @override
  State<FlashApp> createState() => _FlashState();
}

class _FlashState extends State<FlashApp> {
  @override
  Widget build(BuildContext context) {
    ScreenSize.init(context); // 화면 크기 초기화
    return MaterialApp(
        theme: ThemeData(
        colorScheme: ColorScheme.dark(
        primary: Color(0xFF7882DE), // 프라이머리 컬러를 7882DE로 설정
        background: Color(0xFF464646), // 배경 색상을 464646으로 설정
          ),
        ),
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
                    color: Colors.white,
                    fontSize: 17 * ScreenSize.scaleWidth(context), // 글자 크기
                  ),
                ),
              ),
            ),
          ],
        ),
        bottomNavigationBar: BottomAppBar(
          height: 60,
          child: Center(
            child: Text('Advertisement'),
          ),
        ),
      ),
    );
  }
}