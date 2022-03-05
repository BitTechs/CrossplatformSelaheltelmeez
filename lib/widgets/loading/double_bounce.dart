import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:selaheltelmeez/core/theme/common_colors.dart';

class DoubleBounce extends StatelessWidget {
  const DoubleBounce({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) =>
      SpinKitDoubleBounce(
      color: CommonColors.doubleBounderColor,
      size: 50.0,
    );

}
