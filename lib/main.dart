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
        home : Scaffold(
            body: FlashUI(),
            bottomNavigationBar: BottomAppBar(
                height : 60,
                child : Center(
                    child : Text('Advertisement'))
            )
        )
    );
  }
}
