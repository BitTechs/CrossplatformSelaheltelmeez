import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:selaheltelmeez/widgets/widget_imports.dart';
import 'package:webview_flutter/webview_flutter.dart';

class GameObjectWebViewer extends StatefulWidget {
  final String url;
  final bool isLandScape;
  const GameObjectWebViewer({Key? key, required this.url, required this.isLandScape})
      : super(key: key);

  @override
  State<GameObjectWebViewer> createState() => _GameObjectWebViewerState();
}

class _GameObjectWebViewerState extends State<GameObjectWebViewer> {
  late WebViewController _webController;
  @override
  void initState() {
    super.initState();
    // Enable virtual display.
    if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
  }

  @override
  Widget build(BuildContext context) {
    return FlatAppScaffold(
      child: WebView(
          initialUrl: widget.url,
          javascriptMode: JavascriptMode.unrestricted,
          debuggingEnabled: true,
          onWebViewCreated: (WebViewController controller){
            _webController = controller;
            _webController.runJavascript("""
              window.postMessage({
                  event_name: 'setStartPoint',
                  data: { p1: 3, p2: '75' }
              }, 'https://www.selaheltelmeez.com');
              """);
          },
          javascriptChannels: {
            JavascriptChannel(
                name: 'SendProgress',
                onMessageReceived: (JavascriptMessage message) {
                  //TODO: POST Message TO API
                  print("message got received");
                  print(message.message);
                })
          }),
    );
  }
  String generateLandscapeLayout(String gameObjectUrl,String progress, int code){
    return """ 
    <!DOCTYPE html>
     <html lang="en">
    <head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
    <style>
        body {
            width: 100vw;
            height: 100vh;
            margin: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            position: relative;
            background-color: white;
            background-image: url(./preloader.gif);
            background-repeat: no-repeat;
            background-position: center center;
        }
        iframe {
            width: 100vw;
            height: 100vh;
            background: transparent;
        }
    </style>
</head>

<body>
      <iframe id="myFrame" onload="iframeLoaded()" src="$gameObjectUrl" frameborder="0"></iframe>

      <script>
      
        var iframeEl = document.getElementById('myFrame');
        
        var isMobile = {
            Android: function () {
                return navigator.userAgent.match(/Android/i);
            },
            BlackBerry: function () {
                return navigator.userAgent.match(/BlackBerry/i);
            },
            iOS: function () {
                return navigator.userAgent.match(/iPhone|iPad|iPod/i);
            },
            Opera: function () {
                return navigator.userAgent.match(/Opera Mini/i);
            },
            Windows: function () {
                return navigator.userAgent.match(/IEMobile/i) || navigator.userAgent.match(/WPDesktop/i);
            },
            any: function () {
                return (isMobile.Android() || isMobile.BlackBerry() || isMobile.iOS() || isMobile.Opera() || isMobile.Windows());
            }
        };

        function bindEvent(element, eventName, eventHandler) {
            if (element.addEventListener) {
                element.addEventListener(eventName, eventHandler, false);
            } else if (element.attachEvent) {
                element.attachEvent('on' + eventName, eventHandler);
            }
        }

        function iframeLoaded() {
            iframeEl.contentWindow.postMessage({
                event_name: 'setStartPoint',
                data: { p1: $code, p2: $progress }
            }, '*');
        }

        function initResize() {

            var widthF = innerWidth + "px";
            var HeightF = innerHeight + "px";

            if (isMobile.Android()) {

                if (innerHeight > innerWidth) {

                    document.getElementById("myFrame").style.width = widthF;
                    document.getElementById("myFrame").style.height = (window.innerWidth / 3) * 2 + "px";

                }
                if (innerWidth > innerHeight) {

                    document.getElementById("myFrame").style.height = HeightF;
                    document.getElementById("myFrame").style.width = (window.innerHeight / 2) * 3 + "px";

                }
            }

            if (isMobile.iOS()) {

                if (innerHeight > innerWidth) {

                    document.getElementById("myFrame").style.width = widthF;
                    document.getElementById("myFrame").style.height = (window.innerWidth / 3) * 2 + "px";
                    alert(widthF);
                    alert((window.innerWidth / 3) * 2);
                }

                if ((innerWidth / innerHeight) == 4 / 3 || (innerWidth / innerHeight) == 1366 / 1024 || (innerWidth / innerHeight) == 1024 / 748) {

                    document.getElementById("myFrame").style.width = widthF;
                    document.getElementById("myFrame").style.height = (window.innerWidth / 3) * 2 + "px";
                }
            }
        }

        var background = function () {
            //console.log('enter back')
            iframeEl.contentWindow.postMessage("background", '*');
        }

        var foreground = function () {
            //console.log('enter for')
            iframeEl.contentWindow.postMessage("foreground", '*');
        }

        var DisposeHtml = function () {
            document.body.innerHTML = '';
        }

        var initSingleTouch = function () {
            //createjs.Touch.enable(stage, [singleTouch = true]);
            iframeEl.contentWindow.postMessage("SingleTouch", '*');
        }

        bindEvent(window, 'message', function (e) {
          
        });
      </script>
    </body>
   </html>
    """;
  }
}
