import 'package:toktik/domain/entities/videos_post.dart';
//Implementacion de estas clases abstractas Repo y DataSource
abstract class VideoPostsRepository {

  //Cargar los videos favoritos del usuario
  Future <List<VideoPost>> getFavoriteVideosByUser(String userID);


  //Cargar los videos que ha subido el usuario
  Future<List<VideoPost>> getTrendingVideoByPage(int page);
  
}