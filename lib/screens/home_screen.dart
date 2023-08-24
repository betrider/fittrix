import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late VideoPlayerController _controller1;
  late VideoPlayerController _controller2;
  bool _isPlayingFirstVideo = true;

  @override
  void initState() {
    super.initState();

    _controller1 = VideoPlayerController.asset('assets/first_video.mp4')
      ..initialize().then((_) {
        _controller1.play();
      });

    _controller1.addListener(() {
      if (_controller1.value.position >= _controller1.value.duration) {
        // 첫 번째 영상이 종료되었을 때
        setState(() {
          _isPlayingFirstVideo = false;
        });
        _controller1.pause();
        _controller2.play(); // 두 번째 영상 재생
      }
    });

    _controller2 = VideoPlayerController.asset('assets/first_video.mp4')..initialize();

    _controller2.addListener(() {
      if (_controller2.value.position >= _controller2.value.duration) {
        // 두 번째 영상이 종료되었을 때
        setState(() {
          _isPlayingFirstVideo = true;
        });
        _controller2.pause();
        _controller1.play(); // 첫 번째 영상 재생
      }
    });
  }

  @override
  void dispose() {
    _controller1.dispose();
    _controller2.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.black,
        child: Center(
          child: AspectRatio(
            aspectRatio: 1,
            child: _isPlayingFirstVideo
                ? VideoPlayer(_controller1)
                : VideoPlayer(_controller2),
          ),
        ),
      ),
    );
  }
}
