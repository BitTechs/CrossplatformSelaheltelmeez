import 'package:flutter/material.dart';

class NavigationBarScaffold extends StatelessWidget {
  final Widget child;
  final BottomNavigationBar navigationBar;
  const NavigationBarScaffold({Key? key, required this.child, required this.navigationBar}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: SafeArea(child: child),

      bottomNavigationBar: navigationBar,

    );
  }
}
