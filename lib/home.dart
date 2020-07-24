import 'package:flutter/material.dart';
import 'package:heroes_provider/heroes_controller.dart';
import 'package:provider/provider.dart';

import 'hero_model.dart';

class HomeWidget extends StatefulWidget {
  @override
  _HomeWidgetState createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  _buildList(HeroesController heroesController) {
    return ListView.builder(
      itemCount: heroesController.heroes.length,
      itemBuilder: (context, index) {
        return _buildItems(heroesController.heroes[index], heroesController);
      },
    );
  }

  _buildItems(HeroModel heroModel, HeroesController heroesController) {
    return Padding(
      padding: const EdgeInsets.only(left: 8, right: 8),
      child: Card(
        margin: const EdgeInsets.all(8.0),
        color: Colors.blue[100],
        child: ListTile(
            onTap: () {
              print('clicado');
              heroesController.checkFavorite(heroModel);
            },
            title: Text(heroModel.name),
            trailing: heroModel.isFavorite == false
                ? Icon(
                    Icons.star_border,
                    color: Colors.black,
                  )
                : Icon(Icons.star, color: Colors.amber)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Provider'),
        centerTitle: true,
        leading: Consumer<HeroesController>(
          builder: (context, heroesController, widget) {
            return Center(
                child: Text(
              '${heroesController.heroes.where((i) => i.isFavorite).length}',
              style: TextStyle(fontSize: 22),
            ));
          },
        ),
      ),
      body: Consumer<HeroesController>(
          builder: (context, heroesController, widget) {
        return _buildList(heroesController);
      }),
    );
  }
}
