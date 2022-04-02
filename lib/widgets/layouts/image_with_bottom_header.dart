import 'package:flutter/material.dart';
import 'package:selaheltelmeez/core/theme/common_colors.dart';
import 'package:sizer/sizer.dart';

class ImageWithBottomHeader extends StatelessWidget {
  final String image;
  final String header;
  final Color headerBackgroundColor;
  final double? width;
  final bool isNetworkImage;
  const ImageWithBottomHeader({Key? key,
    required this.image,
    required this.header,
    required this.headerBackgroundColor,
    this.width,
    this.isNetworkImage = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: Column(children: [
        Center(child: isNetworkImage ?  Image(image:NetworkImage(image)) : Image(image:AssetImage(image))),
        Align(
          alignment: Alignment.bottomCenter,
          child: SizedBox(
            height: 4.h,
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
                      ?.copyWith(color: Colors.white,
                  fontSize: 8.sp),
                ),
              ),
            ),
          ),
        ),
      ]),
    );
  }
}


class ImageWithFloatingBottomHeader extends StatelessWidget {
  final String image;
  final String header;
  final Color headerColor;
  final Color headerBackgroundColor;
  final double? width;
  final bool isNetworkImage;
  final Alignment alignment;
  const ImageWithFloatingBottomHeader({Key? key,
    required this.image,
    required this.header,
    required this.headerBackgroundColor,
    this.width,
    this.isNetworkImage = false,
    required this.headerColor, required this.alignment}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: Stack(
        alignment: AlignmentDirectional.bottomCenter,
          children: [
        Padding(
          padding:  EdgeInsets.only(bottom: 4.5.w),
          child: Container(
            color: Colors.grey[100],
              child: Center(child: isNetworkImage ?  Image(image:NetworkImage(image)) : Image(image:AssetImage(image)))),
        ),
        Padding(
          padding:  EdgeInsets.symmetric(horizontal: 6.w),
          child: Align(
            alignment: alignment,
            child: SizedBox(
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
                  child: Padding(
                    padding:  EdgeInsets.symmetric(horizontal: 2.w),
                    child: Text(
                      header,
                      style: Theme.of(context)
                          .textTheme
                          .bodyLarge
                          ?.copyWith(color: headerColor),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ]),
    );
  }
}


