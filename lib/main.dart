import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:toktik/config/theme/app_theme.dart';
import 'package:toktik/presentation/screens/discover/discover_screen.dart';
import 'package:toktik/presentation/screens/discover/providers/discover_provider.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        //Instacia para tener accesible la clase DiscoverProvider a toda la aplicacion
        ChangeNotifierProvider(
          lazy: false, // 
          create: (_) => DiscoverProvider()..loadNextPage() 
          ), // Llamamos al metodo loadNextPage con cascada
      ],
      child: MaterialApp(
        title: 'Toktik',
        debugShowCheckedModeBanner: true,
        theme: AppTheme().getTheme(),
        home: const DiscoverScreen()
      ),
    );
  }
}