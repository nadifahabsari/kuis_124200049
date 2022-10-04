import 'package:flutter/material.dart';
import 'package:kuis_124200049/game_store.dart';
import 'package:kuis_124200049/detail_page.dart';

class GameList extends StatefulWidget {
  const GameList({Key? key}) : super(key: key);

  @override
  State<GameList> createState() => _GameListState();
}

class _GameListState extends State<GameList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("List Games"),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          final GameStore game = gameList[index];
          return InkWell(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return DetailPage(game: game);
              }));
              // Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage(username: place.name)));
            },
            child: Container(
              padding: const EdgeInsets.fromLTRB(50, 15, 50, 15),
              child: Card(
                shape: RoundedRectangleBorder(
                  side: BorderSide(
                    color: Colors.lightBlue.shade700,
                  ),
                  borderRadius: BorderRadius.circular(25.0),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: 40,),
                    Image.network(game.imageUrls[0], fit: BoxFit.fill, width: MediaQuery.of(context).size.width, color: Colors.black45, colorBlendMode: BlendMode.darken,),
                    SizedBox(height: 15,),
                    Text(game.name, style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),),
                    SizedBox(height: 10,),
                    Text("Rate : " + game.reviewAverage, style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 20,),
                    Text(game.price, style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 20,),
                  ],
                ),
              ),
            ),
          );
        },
        itemCount: gameList.length,
      ),
    );
  }
}