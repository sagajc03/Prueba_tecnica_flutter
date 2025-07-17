import 'package:flutter/material.dart';
import '../cats/cat_card.dart';
import '../../models/cat.dart';

class HomeScreen extends StatelessWidget {
  // Uses the cat api to display images of cats
  final Future<List<Cat>> catsFuture = Cat.fetch10Cats();
  // Implementing the api

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Imagenes de Gatos con API')),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              CatCard('https://cdn2.thecatapi.com/images/0XYvRd7oD.jpg', ''),
              CatCard('https://cdn2.thecatapi.com/images/0XYvRd7oD.jpg', ''),
              CatCard('https://cdn2.thecatapi.com/images/0XYvRd7oD.jpg', ''),
            ],
          ),
        ),
      ),
    );
  }
}
