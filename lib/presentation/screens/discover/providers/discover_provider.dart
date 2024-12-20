import 'package:flutter/material.dart';
import 'package:toktik/domain/entities/videos_post.dart';
import 'package:toktik/infrastructure/models/local_video_model.dart';
import 'package:toktik/shared/data/local_video_post.dart';


// Ahora tengo accesible esta clase a lo largo de toda mi aplicacion
class DiscoverProvider extends ChangeNotifier{
  // TODO: Repository Va ser quien me va a permitir a mi lanzar las peticiones respectivas, DataSource Fuente de la data

  bool initialLoading = true;

  // Tener una lista de VideoPost
  List<VideoPost> videos = [];


  //Donde voy a cargar mis videos?
  Future<void> loadNextPage()async {

    await Future.delayed(const Duration(seconds: 2));
    final List<VideoPost> newVideos = videoPosts.map( (video) => LocalVideoModel.fromJson(video).toVideoPostEntity()).toList();
    
    videos.addAll(newVideos);
    initialLoading = false;
    notifyListeners();
  }
}