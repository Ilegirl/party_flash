import 'package:flutter/material.dart';

import '../component/single/button/FlashButton.dart';
import '../component/single/margin/Crossmargin.dart';
import '../component/single/slider/TempoSlider.dart';
import '../genre/Genre.dart';

class FlashUI extends StatefulWidget {
  const FlashUI({Key? key}) : super(key: key);

  @override
  _FlashUIState createState() => _FlashUIState();
}

class _FlashUIState extends State<FlashUI> {
  double _currentSliderValue = 20;
  Genre _currentGenre = Genre.none;
  void _onFlashButtonPressed(Genre genre) {
    setState(() {
      if(_currentGenre == genre) {
        // 이미 활성화된 버튼을 눌렀을 때
        _currentGenre = Genre.none;
      } else {
        // 다른 버튼을 눌렀을 때
        _currentGenre = genre;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(5.0), // 패딩을 원하는 만큼 추가합니다.
          child: SizedBox(
            width: MediaQuery.of(context).size.width * 0.95, // 화면 너비의 80%를 차지하는 너비로 설정합니다.
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    FlashButton(
                      genre: Genre.ballad,
                      isActive: _currentGenre == Genre.ballad,
                      onPressed: () => _onFlashButtonPressed(Genre.ballad),
                    ),
                    Crossmargin(),
                    FlashButton(
                      genre: Genre.dance,
                      isActive: _currentGenre == Genre.dance,
                      onPressed: () => _onFlashButtonPressed(Genre.dance),
                    ),
                    Crossmargin(),
                    FlashButton(
                      genre: Genre.edm,
                      isActive: _currentGenre == Genre.edm,
                      onPressed: () => _onFlashButtonPressed(Genre.edm),
                    )
                  ],
                ),
                TempoSlider(
                  value: _currentSliderValue,
                  onChanged: (double value) {
                    setState(() {
                      _currentSliderValue = value;
                    });
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
