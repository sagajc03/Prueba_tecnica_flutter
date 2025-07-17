import 'package:flutter/material.dart';
import '../cats/cat.dart';

class HomeScreen extends StatelessWidget {
  // Uses the cat api to display images of cats

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
              CatCard(
                Image.network(
                  'https://cdn2.thecatapi.com/images/0XYvRd7oD.jpg',
                ),
                '',
              ),
              CatCard(
                Image.network(
                  'https://cdn2.thecatapi.com/images/0XYvRd7oD.jpg',
                ),
                'Cute Cat',
              ),
              CatCard(
                Image.network(
                  'https://cdn2.thecatapi.com/images/0XYvRd7oD.jpg',
                ),
                'Cute Cat',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
