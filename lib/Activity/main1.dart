import 'package:flutter/material.dart';
import 'package:food_recipe_app/Activity/home.dart';
import 'package:food_recipe_app/Activity/home1.dart';
import 'package:food_recipe_app/main.dart';

void main(){

      runApp(MyApp());
}


class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(

      title: 'Flutter demo',
      theme: ThemeData(
        fontFamily: "michroma",
        primarySwatch: Colors.blue,

      ),

      home: Home(),

    );
  }




}
