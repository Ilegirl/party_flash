import 'package:flutter/material.dart';
import '../../../global/ScreenSize.dart';
import '../../../component/single/slider/CustomThumb.dart';
import '../../../theme/theme.dart';

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
    return ValueListenableBuilder<ThemeMode>(
      valueListenable: CustomThemeMode.themeMode,
      builder: (context, mode, child) {
        ThemeData themeData = mode == ThemeMode.light ? CustomThemeData.light : CustomThemeData.dark;

        Color lightTickMarkColor    = Color(0xFF797979); // 사용자가 원하는 TickMarkColor
        Color lightTrackColor       = Color(0xFFC9C9C9); // 사용자가 원하는 TrackColor
        Color lightOuterCircleColor = Color(0xFF797979); // 사용자가 원하는 OuterCircleColor
        Color lightInnerCircleColor = Color(0xFFDFDFDF); // 사용자가 원하는 InnerCircleColor
        Color lightText             = Color(0xFF4E4E4E); // 사용자가 원하는 text 색상
        Color darkTickMarkColor     = Color(0xFFBFBFBF); // 사용자가 원하는 TickMarkColor
        Color darkTrackColor        = Color(0xFF797979); // 사용자가 원하는 TrackColor
        Color darkOuterCircleColor  = Color(0xFFD9D9D9); // 사용자가 원하는 OuterCircleColor
        Color darkInnerCircleColor  = Color(0xFF7882DE); // 사용자가 원하는 InnerCircleColor
        Color darkText              = Color(0xFFD9D9D9); // 사용자가 원하는 disabled 색상

        Color customTickMarkColor = mode == ThemeMode.light ? lightTickMarkColor : darkTickMarkColor;
        Color customTrackColor = mode == ThemeMode.light ? lightTrackColor : darkTrackColor;
        Color customOuterCircleColor = mode == ThemeMode.light ? lightOuterCircleColor : darkOuterCircleColor;
        Color customInnerCircleColor = mode == ThemeMode.light ? lightInnerCircleColor : darkInnerCircleColor;
        Color customTextColor = mode == ThemeMode.light ? lightText : darkText;


        return SliderTheme(
          data: SliderTheme.of(context).copyWith(
            trackHeight: 20 * ScreenSize.scaleWidth(context),
            trackShape: CustomTrackShape(),
            inactiveTickMarkColor: customTickMarkColor,
            activeTickMarkColor: customTickMarkColor,
            activeTrackColor: customTrackColor,
            inactiveTrackColor: customTrackColor,
            // thumbColor: customTickMarkColor,
            thumbShape: DonutSliderThumbShape(
              outerRadius: 17 * ScreenSize.scaleWidth(context),
              innerRadius: 12 * ScreenSize.scaleWidth(context),
              outerCircleColor: customOuterCircleColor,
              innerCircleColor: customInnerCircleColor,
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
                      padding: EdgeInsets.only(
                          top: 60 * ScreenSize.scaleWidth(context)),
                      child: Text(
                        '  x0.5',
                        textAlign: TextAlign.left,
                        style: themeData.textTheme.bodyLarge!.copyWith(
                          color: customTextColor,
                          fontSize: 20 * ScreenSize.scaleWidth(context),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(
                          top: 60 * ScreenSize.scaleWidth(context)),
                      child: Text(
                        'x1',
                        textAlign: TextAlign.center,
                        style: themeData.textTheme.bodyLarge!.copyWith(
                          color: customTextColor,
                          fontSize: 20 * ScreenSize.scaleWidth(context),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(
                          top: 60 * ScreenSize.scaleWidth(context)),
                      child: Text(
                        '                  x2',
                        textAlign: TextAlign.center,
                        style: themeData.textTheme.bodyLarge!.copyWith(
                          color: customTextColor,
                          fontSize: 20 * ScreenSize.scaleWidth(context),
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        );
      },
    );
  }
}
