import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_svg/svg.dart';
import 'package:selaheltelmeez/assets/assets_image.dart';
import 'package:selaheltelmeez/core/theme/common_colors.dart';
import 'package:selaheltelmeez/core/validation_rules/validatable.dart';
import 'package:sizer/sizer.dart';

class FancyPasswordFormField extends StatelessWidget {
  final String placeholderText;
  final String? helperText;
  final double? width;
  final double? height;
  final List<ValidationRule>? validators;
  final String name;
  const FancyPasswordFormField({Key? key, required this.placeholderText,  this.width,  this.validators, required this.name, this.helperText, this.height}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        SvgPicture.asset(
          AssetsImage.inputBackground,
          color: CommonColors.inputBackgroundColor,
          width: width ?? 90.h,
          height: height ?? 10.h,
        ),
        FormBuilderTextField(
            name: name,
            textAlign: TextAlign.center,
            obscureText: true,
            enableSuggestions: false,
            autocorrect: false,
            decoration:  InputDecoration(
              hintText: placeholderText,
              helperText: helperText,
              border: InputBorder.none,
              focusedBorder: InputBorder.none,
              enabledBorder: InputBorder.none,
              errorBorder: InputBorder.none,
              disabledBorder: InputBorder.none,
              contentPadding: const EdgeInsets.only(left: 35, bottom: 0, top: 0, right: 35),
              errorStyle:Theme.of(context).textTheme.bodySmall?.copyWith(color: CommonColors.errorTextColor,
                  height: 0.3,
                  fontSize: 12.sp),),
              validator: (value)=> validators?.getValidationErrorMessage(value)
        ),
      ],
    );
  }
}
