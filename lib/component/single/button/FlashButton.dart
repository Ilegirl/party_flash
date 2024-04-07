
import 'package:flutter/material.dart';
import 'FlashFunction.dart';

class FlashButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;

  const FlashButton({Key? key, required this.label, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isFlashOn = false; // 플래시 상태를 추적하는 변수

    return SizedBox(
      width: 200.0,
      height: 100.0,
      child: OutlinedButton(
        onPressed: () {
          if (label == '')
          isFlashOn = !isFlashOn; // 플래시 상태를 토글
          _toggleFlash(isFlashOn); // 버튼을 누를 때 _toggleFlash 함수 호출

        },
        child: Text(
          label,
          style: TextStyle(color: Colors.black),
        ),
      ),
    );
  }
}

void _toggleFlash(bool isFlashOn) {
  FlashFunction.toggleFlash(isFlashOn); // 플래시 상태를 전달하여 toggleFlash 함수 호출
}
