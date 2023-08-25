import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

/// 홈 화면
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

    _controller1 = VideoPlayerController.asset('assets/ad_video1.mp4')
      ..initialize().then((_) {
        _controller1.play();
      });

    _controller2 = VideoPlayerController.asset('assets/ad_video2.mp4')
      ..initialize();

    _controller1.addListener(() async {
      if (_controller1.value.position >= _controller1.value.duration) {
        // 첫 번째 영상이 종료되었을 때
        setState(() {
          _isPlayingFirstVideo = false;
        });
        _controller1.pause();
        _controller2.play();
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
      body: Center(
        child: AspectRatio(
          aspectRatio: 1,
          child: _isPlayingFirstVideo
              ? VideoPlayer(_controller1)
              : VideoPlayer(_controller2),
        ),
      ),
    );
  }
}
