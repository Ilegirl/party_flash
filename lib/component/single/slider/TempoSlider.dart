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
              fontSize: 30 * ScreenSize.scaleWidth(context),
              color: Colors.white,
            ),
          ),
          SizedBox(height: 20 * ScreenSize.scaleWidth(context)),
          CustomSlider(
            value: _currentSliderValue,
            onChanged: (value) {
              setState(() {
                _currentSliderValue = value;
              });
              if (widget.onChanged != null) {
                widget.onChanged!(value);
              }
            },
          ),
        ],
      ),
    );
  }
}

class CustomSlider extends StatefulWidget {
  final double value;
  final ValueChanged<double>? onChanged;

  const CustomSlider({Key? key, required this.value, this.onChanged})
      : super(key: key);

  @override
  _CustomSliderState createState() => _CustomSliderState();
}

class _CustomSliderState extends State<CustomSlider> {
  late double _currentSliderValue;

  @override
  void initState() {
    super.initState();
    _currentSliderValue = widget.value;
  }

  @override
  Widget build(BuildContext context) {
    return SliderTheme(
      data: SliderTheme.of(context).copyWith(
        trackHeight: 20 * ScreenSize.scaleWidth(context), // 슬라이더 바의 두께 조절
        inactiveTickMarkColor: Color(0xFFD9D9D9),
        activeTickMarkColor: Color(0xFFD9D9D9),
        activeTrackColor: Color(0xFF797979),
        inactiveTrackColor: Color(0xFF797979),
        thumbColor: Color(0xFFD9D9D9),
        thumbShape: DonutSliderThumbShape(
          outerRadius: 17 * ScreenSize.scaleWidth(context), // thumb 바깥 반지름
          innerRadius: 12 * ScreenSize.scaleWidth(context), // thumb 안쪽 반지름
        ),
      ),
      child: Stack(
        children: [
          Slider(
            value: _currentSliderValue,
            min: 0,
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(top: 60 * ScreenSize.scaleWidth(context)), // 위쪽 패딩 추가
                  child: Text(
                    '   x0.5',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20 * ScreenSize.scaleWidth(context), // 글자 크기
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(top: 60 * ScreenSize.scaleWidth(context)), // 위쪽 패딩 추가
                  child: Text(
                    'x1',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20 * ScreenSize.scaleWidth(context), // 글자 크기
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(top: 60 * ScreenSize.scaleWidth(context)), // 위쪽 패딩 추가
                  child: Text(
                    '          x2',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20 * ScreenSize.scaleWidth(context), // 글자 크기
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class DonutSliderThumbShape extends SliderComponentShape {
  final double outerRadius;
  final double innerRadius;

  const DonutSliderThumbShape({
    required this.outerRadius,
    required this.innerRadius,
  });

  @override
  Size getPreferredSize(bool isEnabled, bool isDiscrete) {
    return Size.fromRadius(outerRadius);
  }

  @override
  void paint(
      PaintingContext context,
      Offset center, {
        required Animation<double> activationAnimation,
        required Animation<double> enableAnimation,
        required bool isDiscrete,
        required TextPainter labelPainter,
        required RenderBox parentBox,
        required SliderThemeData sliderTheme,
        required TextDirection textDirection,
        required double value,
        required double textScaleFactor,
        required Size sizeWithOverflow,
      }) {
    final Canvas canvas = context.canvas;

    final Paint outerCirclePaint = Paint()..color = Color(0xFFD9D9D9);
    final Paint innerCirclePaint = Paint()..color = Color(0xFF7882DE);

    final double innerRadius = outerRadius / 2;

    canvas.drawCircle(center, outerRadius, outerCirclePaint);
    canvas.drawCircle(center, innerRadius, innerCirclePaint);
  }
}
