import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/cat_provider.dart';
import '../cat/cat_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Provider.of<CatProvider>(context, listen: false).addRandomCat();
        },
        child: Icon(Icons.add),
      ),
      appBar: AppBar(
        title: Text(
          "Number of Cats: ${Provider.of<CatProvider>(context).getNumberOfCats()}",
        ),
      ),
      body: SafeArea(
        child: Consumer<CatProvider>(
          builder: (context, catProvider, child) {
            if (catProvider.cats.isEmpty) {
              return Center(child: CircularProgressIndicator());
            } else {
              return ListView(
                children: [
                  ElevatedButton(
                    onPressed: () => catProvider.resetList(),
                    child: Text('Reset List'),
                  ),
                  CatListColumn(cats: catProvider.cats),
                ],
              );
            }
          },
        ),
      ),
    );
  }
}

class CatListColumn extends StatelessWidget {
  final List cats;
  const CatListColumn({super.key, required this.cats});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: cats.map<Widget>((cat) {
        return GestureDetector(
          onTap: () => _onCatTap(context, cat.id),
          child: CatCard(
            cat.url,
            cat.id.isNotEmpty ? "ID: ${cat.id}" : 'Unknown ID',
          ),
        );
      }).toList(),
    );
  }

  _onCatTap(BuildContext context, String catId) {
    Navigator.pushNamed(context, '/catDetails', arguments: {'catId': catId});
  }
}
