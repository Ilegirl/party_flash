
import 'package:flash/genre/GenereFunctionExtension.dart';
import 'package:flash/global/GlobalState.dart';
import 'package:flutter/material.dart';
import '../../../genre/Genre.dart';
import '../../../global/ScreenSize.dart';

class FlashButton extends StatefulWidget {
  final Genre genre;
  final VoidCallback onPressed;

  const FlashButton({Key? key, required this.genre, required this.onPressed})
      : super(key: key);

  @override
  _FlashButtonState createState() => _FlashButtonState();
}

class _FlashButtonState extends State<FlashButton> {
  late String _currentLabel;
  var globalState = GlobalState();

  @override
  void initState() {
    super.initState();
    _currentLabel = widget.genre.eng;
  }

  @override
  Widget build(BuildContext context) {

    return SizedBox(
      width: 280.0 * ScreenSize.scaleWidth(context),
      height: 140.0 * ScreenSize.scaleWidth(context),
      child: OutlinedButton(
        onPressed: () {
          if (globalState.isMusicPlaying) {
            if (globalState.currentGenre == widget.genre) {
              globalState.isMusicPlaying = false;
              globalState.currentGenre = Genre.none;
            } else {
              globalState.isMusicPlaying = false;
              globalState.executeGenreFunction(globalState);
              globalState.currentGenre = widget.genre;
              globalState.isMusicPlaying = true;
              globalState.executeGenreFunction(globalState);
            }
          } else {
            globalState.currentGenre = widget.genre;
            globalState.isMusicPlaying = true;
            globalState.executeGenreFunction(globalState);
          }
          // isFlashOn = !isFlashOn; // 플래시 상태를 토글
          // _toggleFlash(isFlashOn); // 버튼을 누를 때 _toggleFlash 함수 호출
        },
        child: Text(
          _currentLabel,
          style: TextStyle(color: Colors.black),
        ),
      ),
    );
  }
}
