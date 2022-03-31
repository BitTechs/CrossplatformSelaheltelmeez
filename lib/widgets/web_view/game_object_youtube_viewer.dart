import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:selaheltelmeez/widgets/widget_imports.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

class GameObjectYouTubeViewer extends StatefulWidget {
  final String youtubeLink;
  const GameObjectYouTubeViewer({Key? key, required this.youtubeLink}) : super(key: key);
  @override
  State<GameObjectYouTubeViewer> createState() => _GameObjectYouTubeViewerState();
}

class _GameObjectYouTubeViewerState extends State<GameObjectYouTubeViewer> {
  late YoutubePlayerController _controller;

  @override
  void initState(){
    SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeLeft]);
    _controller = YoutubePlayerController(initialVideoId: YoutubePlayerController.convertUrlToId(widget.youtubeLink)!,
        params: const YoutubePlayerParams(
          loop: false,
          desktopMode: true,
        )
    );
    super.initState();
  }

  @override
  void dispose(){
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
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
