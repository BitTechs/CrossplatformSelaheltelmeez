import 'package:enterprise_validator/enterprise_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_svg/svg.dart';
import 'package:selaheltelmeez/assets/assets_image.dart';
import 'package:selaheltelmeez/core/theme/common_colors.dart';
import 'package:sizer/sizer.dart';

class FancyDropDownFormField<T> extends StatelessWidget {
  final String hintTitle;
  final String name;
  final double? width;
  final double? height;
  final List<T> items;
  final T? initialValue;
  final ValidationRule? validator;
  final Widget Function(BuildContext, T) itemBuilder;
  final ValueChanged<T?>? onChanged;
  final bool? isEnabled;
  const FancyDropDownFormField({Key? key, required this.hintTitle,  this.width,  this.validator, required this.items, required this.itemBuilder, this.onChanged, this.initialValue, required this.name, this.height, this.isEnabled}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        SvgPicture.asset(
          AssetsImage.inputBackground,
          color: CommonColors.inputBackgroundColor,
          width: width ?? 90.w,
          height:  height ?? 10.h,
        ),
        FormBuilderDropdown<T>(
            name: name,
            initialValue: initialValue,
            enabled: isEnabled ?? true,
            items: <DropdownMenuItem<T>>[
              for (var item in items)
                DropdownMenuItem(
                  value: item,
                  child: itemBuilder(context, item),
                ),
            ],
              isExpanded: true,
              decoration:  InputDecoration(
              hintText: hintTitle,
              border: InputBorder.none,
              focusedBorder: InputBorder.none,
              enabledBorder: InputBorder.none,
              errorBorder: InputBorder.none,
              disabledBorder: InputBorder.none,
              contentPadding: EdgeInsets.only(left: 15.w, bottom: 0, top: 0, right: 15.w),
              errorStyle:Theme.of(context).textTheme.bodySmall?.copyWith(color: CommonColors.errorTextColor, height: 0.3, fontSize: 12),),
              //validator: (value)=> validator == null? null : validator!(value),
              onChanged: onChanged,
        ),
      ],
    );
  }
}
