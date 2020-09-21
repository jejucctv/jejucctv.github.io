import 'package:video_player/video_player.dart';
import 'package:flutter/material.dart';

Widget videoHsl(BuildContext context, String url) {
  VideoPlayerController _controller;

  return VideoPlayer(_controller);
}

class VideoHls extends StatefulWidget {
  final String url;

  VideoHls(this.url);

  @override
  _VideoHlsState createState() => _VideoHlsState(url);
}

class _VideoHlsState extends State<VideoHls> {
  VideoPlayerController _controller;

  final String _url;

  _VideoHlsState(this._url);

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(_url)
      ..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Video Demo',
      home: Scaffold(
        body: Center(
          child: _controller.value.initialized
              ? AspectRatio(
                  aspectRatio: _controller.value.aspectRatio,
                  child: VideoPlayer(_controller),
                )
              : Container(),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              _controller.value.isPlaying
                  ? _controller.pause()
                  : _controller.play();
            });
          },
          child: Icon(
            _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}
