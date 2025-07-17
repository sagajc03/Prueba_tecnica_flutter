import 'package:flutter/material.dart';

class ImageBanner extends StatelessWidget {
  final String _imageUrl;

  const ImageBanner(this._imageUrl, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.grey),
      constraints: BoxConstraints(minHeight: 200.0, maxHeight: 250.0),
      child: Image.network(_imageUrl, fit: BoxFit.cover),
    );
  }
}
