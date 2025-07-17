import 'package:flutter/material.dart';
import 'Image_banner.dart';
import 'text_section.dart';

class CatDetails extends StatelessWidget {
  const CatDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Cat Image Details')),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ImageBanner('https://cdn2.thecatapi.com/images/0XYvRd7oD.jpg'),
            TextSection('Cat Breed', 'Cute Cat'),
            TextSection('Width', '200px'),
            TextSection('Height', '300px'),
            TextSection('Url', 'https://cdn2.thecatapi.com/images/0XY'),
          ],
        ),
      ),
    );
  }
}
