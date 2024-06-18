import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:toktik/domain/entities/video_post.dart';
import 'package:toktik/presentation/screens/discover/video_buttons.dart';
import 'package:toktik/presentation/widgets/video/fullscreen_player.dart';

class VideoScrollableView extends StatelessWidget {
  final List<VideoPost> videos;

  const VideoScrollableView({super.key, required this.videos});

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      scrollDirection: Axis.vertical,
      physics: const BouncingScrollPhysics(),
      itemCount: videos.length,
      itemBuilder: (_, index) {
        final VideoPost videoPost = videos[index];

        return Stack(
          children: [
            SizedBox.expand(
              child: FullScreenPlayer(videoUrl: videoPost.videoUrl, caption: videoPost.caption),
            ),
            Positioned(bottom: 30, right: 20, child: VideoButtons(video: videoPost))
            ],
        );
      },
    );
  }
}

class _videoView extends StatelessWidget {
  const _videoView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
