import 'package:flutter/material.dart';
import 'package:toktik/domain/entities/videos_post.dart';
import 'package:toktik/presentation/widgets/shared/video/fullscreen_player.dart';
import 'package:toktik/presentation/widgets/shared/video_buttons.dart';

class VideoScrollableView extends StatelessWidget {
  const VideoScrollableView({super.key, required this.videos});

  final List<VideoPost> videos;



  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      scrollDirection: Axis.vertical, //Direccion del scroll
      physics: const BouncingScrollPhysics(), //Fisica de rebote del scroll
      itemCount: videos.length,
      itemBuilder: (context, index) {
        final VideoPost videoPost = videos[index];
        return Stack(
          children: [
            //videoplayer + gradiente
            SizedBox.expand(
              child: FullScreenPlayer(
                caption: videoPost.caption,
                videoUrl: videoPost.videoUrl,
              ),
            ),//Abiertos a us modificacion

            //botones
            Positioned(
              bottom: 40,
              right: 20,
              child: VideoButtons(video: videoPost)
            ),
          ],
        );
      },
    );
  }
}