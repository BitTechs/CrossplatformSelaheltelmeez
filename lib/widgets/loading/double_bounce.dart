import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class DoubleBounce extends StatelessWidget {
  const DoubleBounce({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SpinKitDoubleBounce(
      color: Colors.black,
      size: 50.0,
    );
  }
}
