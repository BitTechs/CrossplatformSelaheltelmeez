import 'package:flutter/material.dart';

class ScrollColumnExpandable extends StatelessWidget {
  final Widget headerWidgets;
  final Widget centeredExpandedWidgets;
  final Widget footerWidgets;
  final CrossAxisAlignment crossAxisAlignment;
  const ScrollColumnExpandable({Key? key, required this.headerWidgets, required this.centeredExpandedWidgets, required this.footerWidgets, required this.crossAxisAlignment}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return SingleChildScrollView(
            child: ConstrainedBox(
                constraints: BoxConstraints(minWidth: constraints.maxWidth, minHeight: constraints.maxHeight),
                child: IntrinsicHeight(
                  child: Column(
                      crossAxisAlignment: crossAxisAlignment,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        headerWidgets,
                        Expanded(child: centeredExpandedWidgets,),
                        footerWidgets,
                      ]
                  ),
                )
            )
        );
      },
    );
  }
}
