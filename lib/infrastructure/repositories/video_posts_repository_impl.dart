import 'package:toktik/domain/datasource/video_posts_datasource.dart';
import 'package:toktik/domain/entities/videos_post.dart';
import 'package:toktik/domain/repositories/video_posts_repository.dart';

class VideoPostsRepositoryImpl implements VideoPostsRepository {

  final VideoPostsDatasource videoPostsDatasource;

  VideoPostsRepositoryImpl({required this.videoPostsDatasource});
  
  @override
  Future<List<VideoPost>> getFavoriteVideosByUser(String userID) {

    throw UnimplementedError();
  }

  @override
  Future<List<VideoPost>> getTrendingVideoByPage(int page) {

    return videoPostsDatasource.getTrendingVideoByPage(page);
  }
  
}