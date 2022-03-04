import 'package:flutter/material.dart';
import 'package:selaheltelmeez/core/theme/app_theme.dart';

class FancyElevatedButton extends StatelessWidget {
  final String title;
  final Color backGroundColor;
  final Color titleColor;
  final Color shadowColor;
  final VoidCallback? onPressed;
  const FancyElevatedButton({Key? key, required this.title, required this.backGroundColor, required this.titleColor, this.onPressed, required this.shadowColor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(backGroundColor),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18.0),
          ),
        ),
      ),
      onPressed: onPressed,
      child: Text(title,
        style: Theme.of(context).textTheme.titleLarge?.copyWith(
            color: titleColor,
            shadows: <Shadow>[
               Shadow(
                offset: const Offset(-1.0, -1.0),
                blurRadius: 0.5,
                color: shadowColor,
              ),
            ]
        ),
      ),
    );
  }
}
