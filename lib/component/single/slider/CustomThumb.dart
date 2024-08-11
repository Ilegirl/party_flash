import 'package:flutter/material.dart';

class DonutSliderThumbShape extends SliderComponentShape {
  final double outerRadius;
  final double innerRadius;
  final Color outerCircleColor;
  final Color innerCircleColor;

  const DonutSliderThumbShape({
    required this.outerRadius,
    required this.innerRadius,
    required this.outerCircleColor,
    required this.innerCircleColor
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

    final Paint outerCirclePaint = Paint()..color = outerCircleColor;
    final Paint innerCirclePaint = Paint()..color = innerCircleColor;

    final double innerRadius = outerRadius / 2;

    canvas.drawCircle(center, outerRadius, outerCirclePaint);
    canvas.drawCircle(center, innerRadius, innerCirclePaint);
  }
}

class CustomTrackShape extends RoundedRectSliderTrackShape {
  @override
  Rect getPreferredRect({
    required RenderBox parentBox,
    Offset offset = Offset.zero,
    required SliderThemeData sliderTheme,
    bool isEnabled = false,
    bool isDiscrete = false,
  }) {
    final double trackHeight = sliderTheme.trackHeight!;
    final double trackLeft = offset.dx + 8; // Left padding for the track
    final double trackTop = offset.dy + (parentBox.size.height - trackHeight) / 2;
    final double trackWidth = parentBox.size.width - 16; // Right padding for the track

    return Rect.fromLTWH(trackLeft, trackTop, trackWidth, trackHeight);
  }
}
