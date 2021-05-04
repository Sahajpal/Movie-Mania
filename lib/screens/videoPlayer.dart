import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class videoPlayer extends StatelessWidget {
  final movie;

  videoPlayer({this.movie});

  @override
  Widget build(BuildContext context) {
    return YoutubePlayer(
      controller: YoutubePlayerController(
        initialVideoId: '5g02v1oz5Y0',
        flags: YoutubePlayerFlags(
          hideControls: false,
          controlsVisibleAtStart: true,
          autoPlay: false,
          mute: false,
        ),
      ),
      showVideoProgressIndicator: true,
    );
  }
}
