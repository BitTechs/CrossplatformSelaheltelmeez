import 'package:enterprise_validator/enterprise_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_svg/svg.dart';
import 'package:selaheltelmeez/assets/assets_image.dart';
import 'package:selaheltelmeez/core/theme/common_colors.dart';
import 'package:sizer/sizer.dart';

class FancyPasswordFormField extends StatelessWidget {
  final String placeholderText;
  final String? helperText;
  final double? width;
  final double? height;
  final List<ValidationRule>? validators;
  final String name;
  final ValueChanged<String?>? onChanged;
  final TextEditingController? controller;
  const FancyPasswordFormField({
    Key? key,
    required this.placeholderText,
    this.width,
    this.validators,
    required this.name,
    this.helperText,
    this.height,
    this.onChanged,
    this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        // SvgPicture.asset(
        //   AssetsImage.inputBackground,
        //   color: CommonColors.inputBackgroundColor,
        //   width: width ?? 90.h,
        //   height: height ?? 10.h,
        // ),
        SizedBox(
          height: 10.h,
          width: MediaQuery.of(context).size.width,
          child: SvgPicture.asset(
            AssetsImage.inputBackground,
            color: CommonColors.inputBackgroundColor,
            fit: BoxFit.fill,
          ),
        ),
        FormBuilderTextField(
            name: name,
            obscureText: true,
            controller: controller,
            enableSuggestions: false,
            autocorrect: false,
            onChanged: onChanged,
            style: TextStyle(
              fontSize: 11.sp,
            ),
            decoration: InputDecoration(
              hintText: placeholderText,
              helperText: helperText,
              border: InputBorder.none,
              focusedBorder: InputBorder.none,
              enabledBorder: InputBorder.none,
              errorBorder: InputBorder.none,
              disabledBorder: InputBorder.none,
              hintStyle: TextStyle(
                fontSize: 11.sp,
              ),
              contentPadding:
                  EdgeInsets.only(left: 4.w, bottom: 0, top: 0, right: 4.w),
              errorStyle: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: CommonColors.errorTextColor,
                  height: 0.3,
                  fontSize: 9.sp),
            ),
            validator: (value) => validators?.getValidationErrorMessage(value)),
      ],
    );
  }
}
