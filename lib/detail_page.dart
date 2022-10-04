import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kuis_124200049/game_store.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({Key? key, required this.game}) : super(key: key);
  final GameStore game;

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: (isFavorite) ? Colors.lightBlueAccent: Colors.white,
      appBar: AppBar(
        title: Text("${widget.game.name}"),
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                isFavorite = !isFavorite;
              });
            },
            icon: (isFavorite)
                ? Icon(Icons.favorite)
                : Icon(Icons.favorite_border),
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(12),
            height: (MediaQuery.of(context).size.height) / 3,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Container(
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  child: Image.network(widget.game.imageUrls[index]),
                );
              },
              itemCount: widget.game.imageUrls.length,
            ),
          ),
          Container(
            padding: EdgeInsets.all(20),
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  height: (MediaQuery.of(context).size.height)/10,
                  width: (MediaQuery.of(context).size.width),
                  child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: widget.game.tags.length,
                    ),
                    itemBuilder: (context,index){
                      return Column(
                        children: [
                          textSedang(widget.game.tags[index])
                        ],
                      );
                    },
                    itemCount: widget.game.tags.length,
                  ),
                ),
                SizedBox(height: 10,),
                Text("${widget.game.name}",
                  style:
                  TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10,),
                Text("Rate : ${widget.game.reviewAverage}",
                  style:
                  TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10,),
                Text("Review : ${widget.game.reviewCount}",
                  style:
                  TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10,),
                Text("Tanggal Release : ${widget.game.releaseDate}",
                  style:
                  TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10,),
                Text("Harga : ${widget.game.price}",
                  style:
                  TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10,),
                Text("${widget.game.about}",
                  style:
                  TextStyle(fontSize: 17),
                ),
                SizedBox(height: 10,),
                Container(
                  child: ElevatedButton(
                    onPressed: () {
                      _launchURL(widget.game.linkStore);
                    },
                    child: Text("Pesan Sekarang"),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget textSedang(String text) {
    return Text(
      text,
      style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
    );
  }

  void _launchURL(_url) async {
    if (!await launch(_url)) throw 'Could not launch $_url';
  }
}

