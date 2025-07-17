import 'package:flutter/material.dart';
import 'Image_banner.dart';
import 'text_section.dart';
import '../../models/cat.dart';

class CatDetails extends StatelessWidget {
  CatDetails({super.key});

  final Future<List<Cat>> catsFuture = Cat.fetch10Cats();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Cat Image Details')),
      body: FutureBuilder<List<Cat>>(
        future: catsFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No cats found.'));
          } else {
            // Example: Use the first cat's data
            final cat = snapshot.data![0];
            return SingleChildScrollView(
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
            );
          }
        },
      ),
    );
  }
}
