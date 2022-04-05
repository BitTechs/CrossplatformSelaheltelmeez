import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:selaheltelmeez/widgets/widget_imports.dart';

class WebViewer extends StatefulWidget {
  final String url;
  final String title;

  const WebViewer({Key? key, required this.url, required this.title})
      : super(key: key);

  @override
  State<WebViewer> createState() => _WebViewerState();
}

class _WebViewerState extends State<WebViewer> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return NavigatedAppScaffold(
      child: InAppWebView(
        initialUrlRequest: URLRequest(url: Uri.parse(widget.url)),
        initialOptions: InAppWebViewGroupOptions(
          android: AndroidInAppWebViewOptions(
            disableDefaultErrorPage: true,
            useHybridComposition: true,

          ),
          crossPlatform: InAppWebViewOptions(
            mediaPlaybackRequiresUserGesture: false,
            horizontalScrollBarEnabled: false,
            verticalScrollBarEnabled: false,
          ),
        ),
      ),

      title: widget.title,
    );
  }
}
