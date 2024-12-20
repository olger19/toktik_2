import 'package:flutter/material.dart';
import 'package:toktik/domain/entities/videos_post.dart';

class VideoScrollableView extends StatelessWidget {
  const VideoScrollableView({super.key, required this.videos});

  final List<VideoPost> videos;



  @override
  Widget build(BuildContext context) {
    return PageView(
      scrollDirection: Axis.vertical, //Direccion del scroll
      physics: const BouncingScrollPhysics(), //Fisica de rebote del scroll
      children: [
        Container( color: Colors.red,),
        Container(color: Colors.blue,),
        Container(color: Colors.teal,),
        Container(color: Colors.yellow,),
        Container(color: Colors.pink,),
        Container(color: Colors.deepPurple,),
      ],
    );
  }
}