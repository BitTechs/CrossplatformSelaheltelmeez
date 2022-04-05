 import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:selaheltelmeez/assets/assets_image.dart';
import 'package:selaheltelmeez/core/theme/common_colors.dart';
import 'package:sizer/sizer.dart';

class FancyAddButton extends StatelessWidget {
  final String title;
  final VoidCallback? onPressed;
  final double? width;
  const FancyAddButton({Key? key, required this.title, this.onPressed, this.width}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Stack(
        alignment: AlignmentDirectional.topStart,
        children: [
          SizedBox(
            height: 5.h,
            width: 50.w,
            child: SvgPicture.asset(
              AssetsImage.inputBackground,
              color: CommonColors.inputBackgroundColor,
              fit: BoxFit.fill,
            ),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children:  [
              Image(
                width: 5.h,
                height: 5.h,
                fit: BoxFit.fill,
                image: const AssetImage(AssetsImage.add),
              ),
              SizedBox(width: 4.w,),
              Text('$title'),
            ],
          ),
        ],
      ),
    );
  }
}
