import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:food_recipe_app/Activity/model.dart';
import 'package:http/http.dart';


class Home1 extends StatefulWidget {
  const Home1({super.key});

  @override
  State<Home1> createState() => _Home1State();
}

class _Home1State extends State<Home1> {

  List<RecipeModel> recipeList = <RecipeModel>[];

  TextEditingController searchController = new TextEditingController();

  getRecipes(String query) async
  {
    String url = "aaffsfkbnvbhhttps://api.edamam.com/search?q=$query&app_id=ebb6041c&app_key=3c33ad913ab23b8554082bfb5fdd78b5";
    Response response = await get(Uri.parse(url));
    Map data = jsonDecode(response.body);

    data["hits"].forEach((each){
     RecipeModel recipeModel = new RecipeModel();
     recipeModel = RecipeModel.fromMap(element["recipe"]);
     recipeList.add(recipeModel);
     log(recipeList.toString());
    });

    recipeList.forEach((Recipe) {
      print(Recipe.applabel);
      print(Recipe.appcalories);


    });


  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(

            width: MediaQuery.of(context).size.width,
            height : MediaQuery.of(context).size.height,

            decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [
                    Color(0xff213A50),
                    Color(0xff071938)

                  ]

              )

            ),

          ),

          Column(

            children: [

              //searchbar

              SafeArea(child: Container(

                padding: EdgeInsets.symmetric(horizontal: 8),
                margin: EdgeInsets.symmetric(horizontal: 24, vertical: 20),


                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(24)),



                child: Row(

                  children: [
                    GestureDetector(
                      onTap: (){
                        if((searchController.text).replaceAll(" ", "") == "")
                        {
                          print("blank Search");

                        }else{
                          getRecipes(searchController,text);
                        }
                      },
                    ),

                     Expanded(child: TextField(

                       controller: searchController,
                       decoration: InputDecoration(
                         border: InputBorder.none, hintText: "Lets cook something!"),
                       ),
                       )
                  ],
                ),
              ),
              ),
             Container(
               padding: EdgeInsets.symmetric(horizontal: 20),

               child: Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                   Text("What do wee cook today", style: TextStyle(fontSize: 33, color: Colors.white),),
                   SizedBox(height: 10,),
                   Text("What do wee cook today", style: TextStyle(fontSize: 33, color: Colors.white),),
                 ],
               ),

             )
            ],
          )
        ],
      ),

    );
  }
}
