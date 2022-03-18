import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:selaheltelmeez/assets/assets_image.dart';
import 'package:selaheltelmeez/core/theme/common_colors.dart';

class FancyDropDownFormField<T> extends StatelessWidget {
  final String hintTitle;
  final double width;
  final List<T> items;
  final T? initialValue;
  final FormFieldValidator<T>? validators;
  final Widget Function(BuildContext, T) itemBuilder;
  final ValueChanged<T?>? onChanged;
  const FancyDropDownFormField({Key? key, required this.hintTitle, required this.width,  this.validators, required this.items, required this.itemBuilder, this.onChanged, this.initialValue}) : super(key: key);

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
        DropdownButtonFormField<T>(
            value: initialValue,
            items: <DropdownMenuItem<T>>[
              for (var item in items)
                DropdownMenuItem(
                  value: item,
                  child: itemBuilder(context, item),
                ),
            ],
              isExpanded: true,
              alignment: Alignment.center,
              decoration:  InputDecoration(
              hintText: hintTitle,
              border: InputBorder.none,
              focusedBorder: InputBorder.none,
              enabledBorder: InputBorder.none,
              errorBorder: InputBorder.none,
              disabledBorder: InputBorder.none,
              contentPadding: const EdgeInsets.only(left: 25, bottom: 0, top: 0, right: 25),
              errorStyle:Theme.of(context).textTheme.bodySmall?.copyWith(color: CommonColors.errorTextColor, height: 0.3, fontSize: 12),),
              validator: validators,
              onChanged: onChanged,
        ),
      ],
    );
  }
}
