import 'package:flutter/material.dart';
import 'package:selaheltelmeez/widgets/loading/double_bounce.dart';

class OpacityLoading extends StatelessWidget {
  final double opacity;
  final Widget child;
  const OpacityLoading({Key? key, required this.opacity, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Opacity(opacity: opacity, child: child,),
        if(opacity != 1.0)
          SizedBox(height: MediaQuery.of(context).size.height,
                   child: const Center(child: DoubleBounce()))
      ],
    );
  }
}
