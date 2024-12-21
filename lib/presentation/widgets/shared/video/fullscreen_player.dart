import 'package:flutter/material.dart';
import 'package:toktik/presentation/widgets/shared/video/video_background.dart';
import 'package:video_player/video_player.dart';

class FullScreenPlayer extends StatefulWidget {
  final String videoUrl;
  final String caption;

  const FullScreenPlayer(
      {super.key, required this.videoUrl, required this.caption});

  @override
  State<FullScreenPlayer> createState() => _FullScreenPlayerState();
}

class _FullScreenPlayerState extends State<FullScreenPlayer> {
  late VideoPlayerController controller;
  //Inicializar el video
  @override
  void initState() {
    super.initState();

    controller = VideoPlayerController.asset(widget.videoUrl)
      ..setVolume(0)
      ..setLooping(true)
      ..play();
  }

  //Evitar que el video se siga reproduciendo en segundo plano
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //FutureBuilder para esperar a que el video se inicialice y construir el widget
    return FutureBuilder(
        future: controller.initialize(),
        builder: (context, snapshot) {
          if (snapshot.connectionState != ConnectionState.done) {
            //Renderizamos este widget mientras el video se inicializa
            return const Center(
                child: CircularProgressIndicator(strokeWidth: 2));
          }
          //Aspecto visual del video envuelto en un GestureDetector para poder pausar o reproducir el video
          return GestureDetector(
            onTap: () {
              //Pausar o reproducir el video
              if (controller.value.isPlaying) {
                controller.pause();
                return;
              } 
              controller.play();
            },
            child: AspectRatio(
                aspectRatio: controller.value.aspectRatio,
                child: Stack(
                  children: [
                    VideoPlayer(controller),
                    //Gradiente

                    VideoBackground(
                      stops: const [0.8,0.1]
                    ),
                    //Texto: Caption del video
                    Positioned(
                      bottom: 20,
                      left: 20,
                      child: _VideoCaption(caption: widget.caption),
                    ),
                  ],
                )),
          );
        });
  }
}

class _VideoCaption extends StatelessWidget {
  final String caption;

  const _VideoCaption({super.key, required this.caption});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    //Configurar el estilo del texto de manera global
    final titleStyle = Theme.of(context).textTheme.titleLarge;
    return SizedBox(
      width: size.width * 0.6,
      child: Text(
        caption,
        maxLines: 2,
        style: titleStyle,
      ),
    );
  }
}
