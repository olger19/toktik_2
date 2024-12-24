import 'package:flutter/material.dart';
import 'package:toktik/domain/entities/videos_post.dart';
import 'package:toktik/domain/repositories/video_posts_repository.dart';



// Ahora tengo accesible esta clase a lo largo de toda mi aplicacion
class DiscoverProvider extends ChangeNotifier{
  // Repository Va ser quien me va a permitir a mi lanzar las peticiones respectivas, DataSource Fuente de la data

  final VideoPostsRepository videoPostsRepositoy;

  bool initialLoading = true;

  // Tener una lista de VideoPost
  List<VideoPost> videos = [];

  DiscoverProvider({
    required this.videoPostsRepositoy
    });


  
  Future<void> loadNextPage()async {
    //Podemos comentar el await para evitar el delay de los videos
    //await Future.delayed(const Duration(seconds: 2));
    //final List<VideoPost> newVideos = videoPosts.map( (video) => LocalVideoModel.fromJson(video).toVideoPostEntity()).toList();
    final newVideos = await videoPostsRepositoy.getTrendingVideoByPage(1);

    videos.addAll(newVideos);
    initialLoading = false;
    notifyListeners();
  }
}