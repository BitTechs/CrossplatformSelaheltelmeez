import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_svg/svg.dart';
import 'package:selaheltelmeez/assets/assets_image.dart';
import 'package:selaheltelmeez/core/theme/common_colors.dart';
import 'package:selaheltelmeez/core/validation_rules/validatable.dart';
import 'package:sizer/sizer.dart';

class FancyTextFormField extends StatelessWidget {
  final String placeholderText;
  final String? helperText;
  final double? width;
  final double? height;
  final List<ValidationRule>? validators;
  final String name;
  const FancyTextFormField(
      {Key? key,
      required this.placeholderText,
      this.width,
      this.height,
      this.validators,
      required this.name,
      this.helperText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        SvgPicture.asset(
          AssetsImage.inputBackground,
          color: CommonColors.inputBackgroundColor,
          width: width ?? 90.w,
          height: height ?? 10.h,
        ),
        FormBuilderTextField(
            name: name,
            textAlign: TextAlign.center,
            decoration: InputDecoration(
              hintText: placeholderText,
              border: InputBorder.none,
              focusedBorder: InputBorder.none,
              enabledBorder: InputBorder.none,
              errorBorder: InputBorder.none,
              disabledBorder: InputBorder.none,
              helperText: helperText,
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
