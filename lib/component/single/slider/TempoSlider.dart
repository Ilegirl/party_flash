import 'package:flutter/material.dart';
import '../../../global/ScreenSize.dart';

class TempoSlider extends StatefulWidget {
  final double value;
  final ValueChanged<double>? onChanged;

  const TempoSlider({Key? key, required this.value, this.onChanged})
      : super(key: key);

  @override
  _TempoSliderState createState() => _TempoSliderState();
}

class _TempoSliderState extends State<TempoSlider> {
  late double _currentSliderValue;

  @override
  void initState() {
    super.initState();
    _currentSliderValue = widget.value == 0 ? 0 : 50;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 400.0 * ScreenSize.scaleWidth(context),
      height: 200.0 * ScreenSize.scaleWidth(context),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Speed',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w700,
              color: Colors.black87,
            ),
          ),
          SizedBox(height: 20),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.58,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: _currentSliderValue == 0 ? Text('x0.5') : SizedBox(),
                  ),
                ),
                Expanded(
                  child: Center(
                    child: _currentSliderValue == 50 ? Text('x1') : SizedBox(),
                  ),
                ),
                Expanded(
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: _currentSliderValue == 100 ? Text('x2') : SizedBox(),
                  ),
                ),
              ],
            ),
          ),
          SliderTheme(
            data: SliderThemeData(
              trackHeight: 10,
              inactiveTickMarkColor: Color(0xFFD9D9D9),
              activeTrackColor: Color(0xFF797979),
              inactiveTrackColor: Color(0xFF797979),
              thumbColor: Color(0xFFD9D9D9)
            ),
            child: Slider(
              value: _currentSliderValue,
              max: 100,
              divisions: 2,
              onChanged: (double value) {
                setState(() {
                  _currentSliderValue = value;
                });
                if (widget.onChanged != null) {
                  widget.onChanged!(value);
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
