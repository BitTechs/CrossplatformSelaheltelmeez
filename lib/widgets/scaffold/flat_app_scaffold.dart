import 'package:flutter/material.dart';

class FlatAppScaffold extends StatelessWidget {
  final Widget child;
  const FlatAppScaffold({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(child: child),
    );
  }
}
