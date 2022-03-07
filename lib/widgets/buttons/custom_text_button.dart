import 'package:flutter/material.dart';

class CustomTextButton extends StatelessWidget {
  final String text;
  final Color color;
  final VoidCallback? onPressed;
  const CustomTextButton({Key? key, required this.text, required this.color, this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        padding: const EdgeInsets.all(8.0),
        primary: Colors.transparent,
        textStyle: const TextStyle(fontSize: 16),
      ),
      onPressed: onPressed,
      child: Text(text,style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: color),
      ),
    );
  }
}
