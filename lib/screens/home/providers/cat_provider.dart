import 'dart:collection';

import 'package:flutter/material.dart';

class CatProvider extends ChangeNotifier {
  HashMap<String, bool> liked = HashMap();

  void addLike(String id) {
    liked[id] == true;
    notifyListeners();
  }
}
