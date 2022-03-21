import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ScaledButtonAssetImage extends StatelessWidget{
  final double? scale;
  final double opacity;
  final VoidCallback? onTap;
  final String imageUrl;
  const ScaledButtonAssetImage({Key? key, required this.scale, required this.opacity, required this.onTap, required this.imageUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      scale: scale,
      child: GestureDetector(
        onTap: onTap,
        child: Opacity(
          opacity: opacity,
          child: CircleAvatar(
            backgroundColor: Colors.white,
            radius: 28.0,
            child: Image(image: AssetImage(imageUrl)),
          ),
        ),
      ),
    );
  }

}
class ScaledButtonNetworkImage extends StatelessWidget{
  final double? scale;
  final VoidCallback? onTap;
  final String imageUrl;
  const ScaledButtonNetworkImage({Key? key, required this.scale, required this.onTap, required this.imageUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      scale: scale,
      child: GestureDetector(
        onTap: onTap,
        child: CircleAvatar(
          backgroundColor: Colors.white,
          radius: 28.0,
          child: Image(image: NetworkImage(imageUrl)),
        ),
      ),
    );
  }
}

class ScaledWidget extends StatelessWidget{
  final double? scale;
  final double opacity;
  final VoidCallback? onTap;
  final Widget child;
  const ScaledWidget({Key? key, required this.scale,  required this.opacity, required this.onTap, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      scale: scale,
      child: GestureDetector(
        onTap: onTap,
        child: Opacity(
            opacity: opacity,
            child: child,
        ),
      ),
    );
  }
}