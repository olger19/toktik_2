// Nos ayude a mapear este video local post
import 'package:toktik/domain/entities/videos_post.dart';

class LocalVideoModel{
  LocalVideoModel({
    required this.name,
    required this.videoUrl,
    this.likes = 0,
    this.views = 0,
  });

  final String name;
  final String videoUrl;
  final int likes;
  final int views;
  // Tomo un mapa de string dynamic y voy a crear instancias de mi videoModel
  // Cuando queramos hacer una respuesta HTTP algun lugar vamos a tener una mapa de tipo
  // dynami dynamic o string dynamic usualmente
  // Ese json es el JSON Object que vamos a recibir de una respuesta HTTP
  // Cuando recibamos eso vamos a querer crear una instancia de una clase y eso lo estamos
  // haciendo aqui con este factory constructor.
  // Estamos basandonos en este nuevo constructor con nombre estamos creando una nueva instancia
  // de nuestro LocalVideoModel
  factory LocalVideoModel.fromJson(Map<String,dynamic> json) => LocalVideoModel(
    // con el name: y con el json['name'], hacemos match
    name: json['name'] ?? '', 
    videoUrl: json["videoUrl"], 
    likes: json["likes"], 
    views: json["views"]
    );
  
  Map<String, dynamic> toJson() => Message(

  );

  //Mapeando:::Mapper
  VideoPost toVideoPostEntity() => VideoPost(
    //name de mi localvideopost con el caption de videosPost.dart
    caption: name,
    videoUrl: videoUrl,
    likes: likes,
    views: views
  );
}