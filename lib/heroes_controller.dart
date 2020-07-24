import 'package:flutter/cupertino.dart';

import 'hero_model.dart';

class HeroesController extends ChangeNotifier {

  List<HeroModel> heroes = [
    HeroModel(name: 'Thor'),
    HeroModel(name: 'Iron Man'),
    HeroModel(name: 'Hulk'),
    HeroModel(name: 'Coringa'),
    HeroModel(name: 'Batman'),
    HeroModel(name: 'Spider-man'),
  ];

  checkFavorite(HeroModel heroModel) {
    heroModel.isFavorite = !heroModel.isFavorite;
    notifyListeners();
  }

}
