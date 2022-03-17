import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:selaheltelmeez/assets/assets_image.dart';
import 'package:selaheltelmeez/core/theme/common_colors.dart';
import 'package:selaheltelmeez/core/validation_rules/validatable.dart';

class FancyTextFormField extends StatelessWidget {
  final String hintTitle;
  final double width;
  final List<ValidationRule>? validators;
  final TextEditingController controller;
  const FancyTextFormField(
      {Key? key,
      required this.hintTitle,
      required this.width,
      this.validators, required this.controller})
      : super(key: key);

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
            controller: controller,
            decoration: InputDecoration(
              hintText: hintTitle,
              border: InputBorder.none,
              focusedBorder: InputBorder.none,
              enabledBorder: InputBorder.none,
              errorBorder: InputBorder.none,
              disabledBorder: InputBorder.none,
              contentPadding:
                  const EdgeInsets.only(left: 35, bottom: 0, top: 0, right: 35),
              errorStyle: Theme.of(context)
                  .textTheme
                  .bodySmall
                  ?.copyWith(color: CommonColors.errorTextColor, height: 0.3),
            ),
            validator: (value) => validators?.getValidationErrorMessage(value)),
      ],
    );
  }
}
