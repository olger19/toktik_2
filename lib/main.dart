import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:toktik/config/theme/app_theme.dart';
import 'package:toktik/infrastructure/datasources/local_video_datasource_impl.dart';
import 'package:toktik/infrastructure/repositories/video_posts_repository_impl.dart';
import 'package:toktik/presentation/screens/discover/discover_screen.dart';
import 'package:toktik/presentation/screens/discover/providers/discover_provider.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {


    final videoPostsReposity = VideoPostsRepositoryImpl(
      videoPostsDatasource: LocalVideoDatasource()
    );


    return MultiProvider(
      providers: [
        //Instacia para tener accesible la clase DiscoverProvider a toda la aplicacion
        ChangeNotifierProvider(
          lazy: false, // 
          create: (_) => DiscoverProvider( videoPostsRepositoy: videoPostsReposity )..loadNextPage() 
          ), // Llamamos al metodo loadNextPage con cascada
      ],
      child: MaterialApp(
        title: 'Toktik',
        debugShowCheckedModeBanner: false,
        theme: AppTheme().getTheme(),
        home: const DiscoverScreen()
      ),
    );
  }
}