import 'package:flutter/material.dart';

class CatCard extends StatefulWidget {
  final Image _catImage;
  final String _catBreed;

  const CatCard(this._catImage, String catBreed, {super.key})
    : _catBreed = catBreed;

  @override
  State<CatCard> createState() => _CatCardState();
}

class _CatCardState extends State<CatCard> {
  bool liked = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Image(
            image: widget._catImage.image,
            height: 200,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              widget._catBreed.isEmpty ? 'Unknown Breed' : widget._catBreed,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
          TextButton(
            style: ButtonStyle(
              backgroundColor: WidgetStateProperty.all<Color>(Colors.blue),
              foregroundColor: WidgetStateProperty.all<Color>(Colors.white),
            ),
            onPressed: () {
              setState(() {
                liked = !liked;
              });
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(liked ? 'Liked' : 'Unliked')),
              );
              // Here you would typically call a method to update the state
              // in your provider, e.g., CatProvider.addLike(catId);
            },
            child: Text(liked ? 'Liked' : 'Like'),
          ),
        ],
      ),
    );
  }
}
