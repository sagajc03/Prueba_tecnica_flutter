import 'package:flutter/material.dart';

class CatCard extends StatelessWidget {
  final String _catImageUrl;
  final String _catId;

  const CatCard(this._catImageUrl, this._catId, {super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Image.network(
            _catImageUrl,
            height: 200,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              _catId.isEmpty ? 'Unknown Id' : _catId,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
