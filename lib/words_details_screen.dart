import 'package:flutter/material.dart';
import 'words.dart';

class WordsDetailsScreen extends StatelessWidget {
  late final Words words;

  WordsDetailsScreen(this.words);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        title: Text(words.word)
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              words.meaning,
              textAlign: TextAlign.justify,
              style: TextStyle(fontSize: 22.0, fontStyle: FontStyle.normal),

            )
          ],
      ),
      ),
    );
  }
}
