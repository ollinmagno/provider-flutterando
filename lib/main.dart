import 'package:flutter/material.dart';
import 'package:heroes_provider/heroes_controller.dart';
import 'package:heroes_provider/home.dart';
import 'package:provider/provider.dart';

void main() => runApp(MultiProvider(
  providers: [
    ChangeNotifierProvider<HeroesController>.value(value: HeroesController()),
  ],
  child: MyApp(),
));

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'App provider',
      theme: ThemeData(primaryColor: Colors.blue),
      home: HomeWidget(),
    );
  }
}