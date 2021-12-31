import 'package:flutter/material.dart';
import 'words_search_screen.dart';
import 'words_details_screen.dart';
import 'words.dart';

void main() {
  runApp( DictApp());
}
class DictApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title:'Flutter Dictionary App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.yellow,
      ),
      home: WordsListScreen(),
    );

  }


}


