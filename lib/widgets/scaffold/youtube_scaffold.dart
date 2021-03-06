import 'package:flutter/material.dart';
import 'package:selaheltelmeez/core/theme/common_colors.dart';

class YouTubeScaffold extends StatelessWidget {
  final Widget child;

  const YouTubeScaffold({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(child: child),
      floatingActionButton: FloatingActionButton.small(
        onPressed: () async {
          await Navigator.of(context).maybePop();
        },
        backgroundColor: CommonColors.youTubeCloseButtonBackGroundColor,
        child: Icon(
          Icons.close,
          color: CommonColors.youTubeCloseButtonColor,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
    );
  }
}
