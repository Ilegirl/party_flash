import 'package:flutter/material.dart';
import '../../../global/ScreenSize.dart';

class Crossmargin extends StatelessWidget {

  const Crossmargin({Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 400.0 * ScreenSize.scaleWidth(context),
      height: 60.0 * ScreenSize.scaleWidth(context)
    );
  }
}
