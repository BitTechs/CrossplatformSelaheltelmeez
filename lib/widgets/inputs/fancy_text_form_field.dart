import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:selaheltelmeez/assets/assets_image.dart';
import 'package:selaheltelmeez/core/theme/common_colors.dart';

class FancyTextFormField extends StatelessWidget {
  final String hintTitle;
  final double width;
  const FancyTextFormField({Key? key, required this.hintTitle, required this.width}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        SvgPicture.asset(
          AssetsImage.inputBackground,
          color: CommonColors.inputBackgroundColor,
          width: width,
        ),
        TextFormField(
          textAlign: TextAlign.center,
          decoration: InputDecoration.collapsed(hintText: hintTitle,),
        ),
      ],
    );
  }
}
