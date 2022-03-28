import 'package:flutter/material.dart';
import 'package:selaheltelmeez/core/theme/app_theme.dart';
import 'package:selaheltelmeez/core/theme/common_colors.dart';
import 'package:sizer/sizer.dart';

class FancyNavigatedAppScaffold extends StatelessWidget {
  final Widget child;
  final String title;
  const FancyNavigatedAppScaffold({Key? key, required this.child, required this.title}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          centerTitle: true,
          elevation: 0.0,
          title: Text(
            title,
            style: AppTheme.screenTitle.copyWith(fontSize: 14.sp),
            textAlign: TextAlign.center,
          ),
          backgroundColor: CommonColors.studentHomeTopBar,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
        body: SafeArea(child: child)
    );
  }
}
