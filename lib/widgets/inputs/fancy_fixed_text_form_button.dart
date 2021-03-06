import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_svg/svg.dart';
import 'package:selaheltelmeez/assets/assets_image.dart';
import 'package:selaheltelmeez/core/theme/common_colors.dart';

class FancyFixedTextFormField extends StatelessWidget {
  final String hintTitle;
  final double width;
  final String name;
  const FancyFixedTextFormField({Key? key, required this.hintTitle, required this.width, required this.name}) : super(key: key);

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
        FormBuilderTextField(
          readOnly: true,
          name : name,
          initialValue: hintTitle,
          decoration: InputDecoration.collapsed(hintText: hintTitle,),
        ),
      ],
    );
  }
}
