import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'Image_banner.dart';
import 'text_section.dart';
import '../cats/providers/cat_provider.dart';

class CatDetails extends StatelessWidget {
  final String catId;

  const CatDetails({super.key, required this.catId});

  @override
  Widget build(BuildContext context) {
    // Recupera el gato del provider
    final catProvider = Provider.of<CatProvider>(context, listen: false);
    final cat = catProvider.getCatById(catId);

    // Si no existe, puedes mostrar un mensaje o hacer fetch manualmente si lo deseas
    if (cat.id.isEmpty) {
      return Scaffold(
        appBar: AppBar(title: Text('Cat Image Details')),
        body: Center(child: Text('No cat found with id $catId')),
      );
    }

    return Scaffold(
      appBar: AppBar(title: Text('Cat Image Details')),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ImageBanner(cat.url),
            TextSection('Id', cat.id),
            TextSection(
              'Cat Breed',
              cat.breeds.isNotEmpty ? cat.breeds[0]['name'] : 'Unknown',
            ),
            TextSection('Width', '${cat.width}px'),
            TextSection('Height', '${cat.height}px'),
            TextSection('Url', cat.url),
          ],
        ),
      ),
    );
  }
}
