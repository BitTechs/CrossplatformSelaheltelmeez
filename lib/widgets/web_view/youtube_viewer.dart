import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:selaheltelmeez/widgets/widget_imports.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

class YouTubeViewer extends StatefulWidget {
  final String videoCode;
  const YouTubeViewer({Key? key, required this.videoCode}) : super(key: key);
  @override
  State<YouTubeViewer> createState() => _YouTubeViewerState();
}

class _YouTubeViewerState extends State<YouTubeViewer> {
  late YoutubePlayerController _controller;
  
  @override
  void initState(){
    SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeLeft]);

    _controller = YoutubePlayerController(initialVideoId: YoutubePlayerController.convertUrlToId("https://www.youtube.com/watch?v=${widget.videoCode}")!,
    params: const YoutubePlayerParams(
      loop: false,
      desktopMode: true,
    )
    );
    super.initState();
  }

  @override
  void dispose(){
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return YouTubeScaffold(child:
    Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.all(24.0),
      child: YoutubePlayerControllerProvider(controller: _controller, child: YoutubePlayerIFrame(controller: _controller,)),
    ));
  }
}
