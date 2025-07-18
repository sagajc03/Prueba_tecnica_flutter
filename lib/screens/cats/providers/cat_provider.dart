import 'package:flutter/foundation.dart';
import 'package:prueba/models/cat.dart';

class CatProvider extends ChangeNotifier {
  List<Cat> _cats = [];

  CatProvider() {
    // Initialize with some data if needed
    Future<List<Cat>> catsFuture = Cat.fetch10Cats();
    catsFuture
        .then((cats) {
          _cats = cats;
          notifyListeners();
        })
        .catchError((error) {
          if (kDebugMode) {
            print('Error fetching cats: $error');
          }
        });
  }

  void resetList() {
    _cats.clear();
    notifyListeners();
    fetchCats();
  }

  void fetchCats() {
    Future<List<Cat>> catsFuture = Cat.fetch10Cats();
    catsFuture
        .then((cats) {
          _cats = cats;
          notifyListeners();
        })
        .catchError((error) {
          if (kDebugMode) {
            print('Error fetching cats: $error');
          }
        });
  }

  void addRandomCat() {
    Future<Cat> randomCatFuture = Cat.fetchRandomCat();
    randomCatFuture
        .then((cat) {
          _cats.add(cat);
          notifyListeners();
        })
        .catchError((error) {
          if (kDebugMode) {
            print('Error fetching random cat: $error');
          }
        });
  }

  void addCatsToList(String id) {
    Future<Cat> catFuture = Cat.fetchCatById(id);
    catFuture
        .then((cat) {
          _cats.add(cat);
          notifyListeners();
        })
        .catchError((error) {
          if (kDebugMode) {
            print('Error fetching cat: $error');
          }
        });
  }

  int getNumberOfCats() {
    return _cats.length;
  }

  Cat getCatById(String id) {
    return _cats.firstWhere(
      (cat) => cat.id == id,
      orElse: () => Cat('', '', 0, 0, []),
    );
  }

  List<Cat> get cats => _cats;
}
