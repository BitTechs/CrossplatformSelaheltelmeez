import 'package:flutter/material.dart';

class ImageWithBottomHeader extends StatelessWidget {
  final String image;
  final String header;
  final Color headerBackgroundColor;
  final double width;
  final double height;
  const ImageWithBottomHeader({Key? key, required this.image, required this.header, required this.headerBackgroundColor, required this.width, required this.height}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: Stack(children: [
        Center(child: Image(image: AssetImage(image))),
        Align(
            alignment: Alignment.bottomCenter,
            child: SizedBox(
              width: width,
              height: 40,
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(40),
                  // if you need this
                  side: BorderSide(
                    color: Colors.grey.withOpacity(0.2),
                    width: 1,
                  ),
                ),
                color: headerBackgroundColor,
                child: Center(
                  child: Text(
                    header,
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge
                        ?.copyWith(color: Colors.white),
                  ),
                ),
              ),
            )),
      ]),
    );
  }
}
