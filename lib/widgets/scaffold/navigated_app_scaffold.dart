import 'package:flutter/material.dart';

class NavigatedAppScaffold extends StatelessWidget {
  final Widget child;
  final String title;
  const NavigatedAppScaffold({Key? key, required this.child, required this.title}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 1,
          title: Text(title,style: Theme.of(context).textTheme.titleMedium),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
        body: child
      ),
    );
  }
}
