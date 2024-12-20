import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:toktik/presentation/screens/discover/providers/discover_provider.dart';
import 'package:toktik/presentation/widgets/shared/video_scrollable_view.dart';

class DiscoverScreen extends StatelessWidget {
  const DiscoverScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //Si ingresan nuevo videos, quiero volver a dibujar
    final discoverProvider = context.watch<DiscoverProvider>();

    //final otroProvider = Provider.of<DiscoverProvider>(context);

    return Scaffold(
      body: discoverProvider.initialLoading 
      ? const Center(child: CircularProgressIndicator( strokeWidth: 2,)) // Indicador de carga aumentar el tamaño del indicador 
      : VideoScrollableView(videos: discoverProvider.videos));
  }
}