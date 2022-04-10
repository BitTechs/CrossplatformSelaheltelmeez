import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:selaheltelmeez/src/data/student/arguments/game_object_argument.dart';
import 'package:selaheltelmeez/src/data/student/dtos/game_object_activity/update_activity_request.dart';
import 'package:selaheltelmeez/src/data/student/repositories/game_object_activity/game_object_activity_repository.dart';
import 'package:selaheltelmeez/widgets/widget_imports.dart';

class GameObjectWebViewer extends StatefulWidget {
  final GameObjectArgument gameObjectArgument;
  const GameObjectWebViewer({Key? key, required this.gameObjectArgument})
      : super(key: key);



  @override
  State<GameObjectWebViewer> createState() => _GameObjectWebViewerState();
}

class _GameObjectWebViewerState extends State<GameObjectWebViewer> {

  late InAppWebViewController _webController;
  late Timer _timer;
  late int learningDuration = 0;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(seconds:1), (Timer t) => learningDuration++);
    if(widget.gameObjectArgument.orientation == 1){
      SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeLeft]);
    }
    // Enable virtual display.
  }

  @override
  void dispose()  {
    if(widget.gameObjectArgument.orientation == 1){
      SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    }
    _timer.cancel();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return FlatAppScaffold(
      child: InAppWebView(
        initialUrlRequest: URLRequest(url: Uri.dataFromString(widget.gameObjectArgument.orientation == 1? generateLandscapeLayout(widget.gameObjectArgument.url,getTextProgress(widget.gameObjectArgument.code),widget.gameObjectArgument.code) :
                                                                                       generatePortraitLayout(widget.gameObjectArgument.url,getTextProgress(widget.gameObjectArgument.code),widget.gameObjectArgument.code) ,  mimeType: 'text/html',
        encoding: Encoding.getByName('utf-8'))),
        onWebViewCreated: (InAppWebViewController controller) {
          _webController = controller;
        },
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
        onConsoleMessage: (controller, consoleMessage) {
          if(consoleMessage.message.startsWith('{"code":')){
            Map<String, dynamic> paredJson = jsonDecode(consoleMessage.message);
            final int code = paredJson["code"];
            print(code);
            final double progress =  getProgress(code);
            context.read<GameObjectActivityRepository>()
                .updateActivityAsync(UpdateActivityRequest(
                learningDurationInSec: learningDuration,
                code: code,
                activityId: widget.gameObjectArgument.activityId,
                studentPoints: widget.gameObjectArgument.clipScore * progress));
          }
        },
      )
    );
  }
  double getProgress(int code){
    switch(code){
      case 0 :
        return 0;
      case 1:
        return 0.25;
      case 2 :
        return 0.50;
      case 3:
        return 0.75;
      case 4:
        return 1.0;
      default:
        return 0;
    }
  }
  String getTextProgress(int code){
    switch(code){
      case 0 :
        return '0';
      case 1:
        return '25';
      case 2 :
        return '50';
      case 3:
        return '75';
      case 4:
        return '100';
      default:
        return '0';
    }
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
            console.log(JSON.stringify(e.data));
        });
      </script>
    </body>
   </html>
    """;
  }

  String generatePortraitLayout(String gameObjectUrl,String progress, int code){
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
      <iframe id="myFrame" onload="iframeLoaded();" src="$gameObjectUrl" frameborder="0"></iframe>

      <script>
      
        var iframeEl = document.getElementById('myFrame');
        
       
        
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
            if (innerHeight > innerWidth) {
                document.getElementById("myFrame").style.width = "100vh";
                document.getElementById("myFrame").style.height = "100vh";
            }
            if (innerWidth > innerHeight) {
                document.getElementById("myFrame").style.height = "100vh";
                document.getElementById("myFrame").style.width = "100vh";
            }
        }

        // Send a message to the child iframe
        var background = function () {
            //console.log('enter back')
            iframeEl.contentWindow.postMessage("background", '*');
        }

        // Send a message to the child iframe
        var foreground = function () {
            //console.log('enter for')
            iframeEl.contentWindow.postMessage("foreground", '*');
        }

        var DisposeHtml = function () {
            document.body.innerHTML = '';
        }

        bindEvent(window, 'message', function (e) {           
            console.log(JSON.stringify(e.data));
        });
        
        window.addEventListener('resize', initResize);

      </script>
    </body>
   </html>
    """;
  }

}
