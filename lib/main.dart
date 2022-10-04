import 'package:flutter/material.dart';
import 'package:kuis_124200049/game_list.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'KUIS',
      debugShowCheckedModeBanner: false,
      home: GameList(),
      //   appBar: AppBar(title: Text("Image Picker")),
      //   body: MenuList(),
      // )
    );
  }
}