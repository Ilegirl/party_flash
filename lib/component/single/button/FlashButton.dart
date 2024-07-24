import 'package:flash/genre/GenereFunctionExtension.dart';
import 'package:flash/global/GlobalState.dart';
import 'package:flutter/material.dart';
import '../../../genre/Genre.dart';
import '../../../global/ScreenSize.dart';

class FlashButton extends StatefulWidget {
  final Genre genre;
  final bool isActive;
  final VoidCallback onPressed;

  const FlashButton({
    Key? key,
    required this.genre,
    required this.isActive, // 버튼 활성화 상태를 받습니다.
    required this.onPressed
  }) : super(key: key);

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
      width: 350.0 * ScreenSize.scaleWidth(context),
      height: 150.0 * ScreenSize.scaleWidth(context),
      child: ElevatedButton(
        onPressed: () {
          widget.onPressed();
          setState(() {
            if (globalState.isMusicPlaying) {
              if (globalState.currentGenre == widget.genre) {
                globalState.isMusicPlaying = false;
                globalState.currentGenre = Genre.none;
              } else {
                globalState.currentGenre = widget.genre;
                globalState.isMusicPlaying = true;
              }
            } else {
              globalState.currentGenre = widget.genre;
              globalState.isMusicPlaying = true;
            }
            globalState.executeGenreFunction(globalState);
          });
        },
          //버튼 클릭시 색상 변경
        style: ElevatedButton.styleFrom(
          backgroundColor: widget.isActive? Colors.blue : Colors.grey,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25), // <-- Radius
          ),
          elevation: 2, // 그림자 효과의 크기를 설정합니다.
        ),
        child: Text(
          _currentLabel,
          style: TextStyle(
            fontSize: 30 * ScreenSize.scaleWidth(context), // 글자 크기
            fontWeight: FontWeight.bold,// 굵기
          ),
        ),
      ),
    );
  }
}