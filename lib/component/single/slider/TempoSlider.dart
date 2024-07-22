import 'package:flutter/material.dart';
import '../../../global/ScreenSize.dart';
import '../../../component/single/slider/CustomSlider.dart';
import '../../../theme/theme.dart';

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
    return ValueListenableBuilder<ThemeMode>(
      valueListenable: CustomThemeMode.themeMode,
      builder: (context, mode, child) {
        ThemeData themeData = mode == ThemeMode.light
            ? CustomThemeData.light
            : CustomThemeData.dark;

        return SizedBox(
          width: 400.0 * ScreenSize.scaleWidth(context),
          height: 200.0 * ScreenSize.scaleWidth(context),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Speed',
                style: themeData.textTheme.titleLarge?.copyWith(
                  fontSize: 32 * ScreenSize.scaleWidth(context),
                  fontWeight: FontWeight.bold,
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
      },
    );
  }
}

