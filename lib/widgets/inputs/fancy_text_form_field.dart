import 'package:enterprise_validator/enterprise_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_svg/svg.dart';
import 'package:selaheltelmeez/assets/assets_image.dart';
import 'package:selaheltelmeez/core/theme/common_colors.dart';
import 'package:sizer/sizer.dart';

class FancyTextFormField extends StatelessWidget {
  final String placeholderText;
  final String? helperText;
  final double? width;
  final double? height;
  final ValidationRule? validator;
  final String name;
  const FancyTextFormField(
      {Key? key,
      required this.placeholderText,
      this.width,
      this.height,
      this.validator,
      required this.name,
      this.helperText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width?? MediaQuery.of(context).size.width,
      child: Stack(
        alignment: Alignment.center,
        children: [
          // SvgPicture.asset(
          //   AssetsImage.inputBackground,
          //   color: CommonColors.inputBackgroundColor,
          //   width: width ?? 90.w,
          //   height: height ?? 10.h,
          // ),
          SizedBox(
            height: height?? 10.h,
            width: MediaQuery.of(context).size.width,
            child: SvgPicture.asset(
              AssetsImage.inputBackground,
              color: CommonColors.inputBackgroundColor,
              fit: BoxFit.fill,
            ),
          ),
          FormBuilderTextField(
              name: name,
              style: TextStyle(
                fontSize: 11.sp,
              ),
              decoration: InputDecoration(
                hintText: placeholderText,
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                errorBorder: InputBorder.none, disabledBorder: InputBorder.none,
                helperText: helperText,
                contentPadding:
                EdgeInsets.only(left: 4.w, bottom: 0, top: 0, right: 4.w),
                hintStyle: TextStyle(
                    fontSize: 11.sp
                ),

                errorStyle: Theme.of(context)
                    .textTheme
                    .bodySmall
                    ?.copyWith(color: CommonColors.errorTextColor, fontSize: 9.sp , height: 0.3),
              ),
              validator: (value)=> validator == null ? null : validator!(value)),
        ],
      ),
    );
  }
}
