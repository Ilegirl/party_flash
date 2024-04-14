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
    _currentSliderValue = widget.value;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: 200.0 * ScreenSize.scaleWidth(context),
        height: 100.0 * ScreenSize.scaleWidth(context),
      child : Slider(
        value: _currentSliderValue,
        max: 100,
        divisions: 2,
        label: _currentSliderValue.round().toString(),
        onChanged: (double value) {
          setState(() {
            _currentSliderValue = value;
          });
          if (widget.onChanged != null) {
            widget.onChanged!(value);
          }
        },
      )
    );
  }
}
