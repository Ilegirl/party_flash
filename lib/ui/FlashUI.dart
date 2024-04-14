import 'package:flutter/material.dart';

import '../component/single/button/FlashButton.dart';
import '../component/single/margin/Crossmargin.dart';
import '../component/single/slider/TempoSlider.dart';
import '../global/Genre.dart';

class FlashUI extends StatefulWidget {
  const FlashUI({Key? key}) : super(key: key);

  @override
  _FlashUIState createState() => _FlashUIState();
}

class _FlashUIState extends State<FlashUI> {
  double _currentSliderValue = 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0), // 패딩을 원하는 만큼 추가합니다.
          child: SizedBox(
            width: MediaQuery.of(context).size.width * 0.8, // 화면 너비의 80%를 차지하는 너비로 설정합니다.
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    FlashButton(
                      genre: Genre.ballad,
                      onPressed: () {},
                    ),
                    Crossmargin(),
                    FlashButton(
                      genre: Genre.dance,
                      onPressed: () {},
                    ),
                    Crossmargin(),
                    FlashButton(
                      genre: Genre.edm,
                      onPressed: () {},
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