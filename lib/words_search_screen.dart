import 'package:flutter/material.dart';
import 'words.dart';
import 'words_details_screen.dart';

class WordsListScreen extends StatefulWidget {
  @override
  _WordsListScreenState createState() => _WordsListScreenState();
}

class _WordsListScreenState extends State<WordsListScreen> {

  List<Words> wordsList = [
    Words(
        word: "Animation",
        meaning: "To help, PageRouteBuilder provides an Animation object. This Animation can be used with Tween and Curve objects to customize the transition animation."
            " This recipe shows how to transition between routes by animating the new route into view from the bottom of the screen.",
        subtitle: "Animate a page route transition"
    ),
    Words(
        word: "Drawer",
        meaning: "In Flutter, use the Drawer widget in combination with a "
            "Scaffold to create a layout with a Material Design drawer.",
        subtitle: "Add a Drawer to screen"
    ),
    Words(
        word: "Lists",
        meaning: "The simplest way to get started using grids is by using the GridView.count() constructor, "
            "because it allows you to specify how many rows or columns you’d like.",
        subtitle: "Create a Grid List"
    ),
    Words(
        word: "Gestures",
        meaning:"You not only want to display information to users, you want users to interact with your app."
            " Use the GestureDetector widget to respond to fundamental actions, such as tapping and dragging.",
        subtitle:  "Handle taps"
    ),
    Words(
        word: "Forms",
        meaning: "To make apps secure and easy to use, check whether the information the user has provided is valid."
            " If the user has correctly filled out the form, process the information. "
            "If the user submits incorrect information, display a friendly error message letting them know what went wrong.",
        subtitle: "Build a Form with validation"
    ),
    Words(
        word: "Effect",
        meaning: "Apps are filled with buttons that execute long-running behaviors. "
            "For example, a button might trigger a download, which starts a download process, receives data over time, and then provides access to the downloaded asset."
            " It’s helpful to show the user the progress of a long-running process, and the button itself is a good place to provide this feedback. ",
        subtitle: "Create a download button"
    ),
    Words(
        word: "Navigation",
        meaning: "Animate a widget across screens",
        subtitle: "It’s often helpful to guide users through an app as they navigate from screen to screen."
            " A common technique to lead users through an app is to animate a widget from one screen to the next. This creates a visual anchor connecting the two screens."
    ),
    Words(
        word: "Networking",
        meaning: "Fetching data from the internet is necessary for most apps."
            " Luckily, Dart and Flutter provide tools, such as the http package, for this type of work.",
        subtitle: "Fetch Data from the internet"
    ),
    Words(
        word: "Persistence",
        meaning: "If you are writing an app that needs to persist and query large amounts of data on the local device, consider using a database instead of a local file or key-value store."
            " In general, databases provide faster inserts, updates, and queries compared to other local persistence solutions.",
        subtitle: "Persist Data with SQLite"
    ),
   

  ];

  List<Words> foundWords = [];

  @override
  void initState(){
    super.initState();

    setState(() {
      foundWords = wordsList;
    });
  }

  void runFilter(String enteredWord){
    List<Words> results= [];
    if (enteredWord.isEmpty){
      results = wordsList;
    }
    else{
      results = wordsList
               .where((words) =>
                 words.word.toLowerCase().contains(enteredWord.toLowerCase())).toList();
    }
    setState(() {
      foundWords = results;
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.grey.shade900,
          title: Container(
            height: 38,
            child: TextField(
              onChanged: (value) => runFilter(value),
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.grey[850],
                contentPadding: const EdgeInsets.all(0),
                prefixIcon: Icon(Icons.search, color: Colors.grey.shade600,),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(50),
                  borderSide: BorderSide.none
                ),
                hintStyle: TextStyle(
                  fontSize: 14,
                  color: Colors.grey.shade600
                ),
                  hintText: "Search words"
              ),

            ),
          )
        ),
        body: Container(
          color: Colors.grey.shade900,
            child: foundWords.isNotEmpty ? ListView.builder(
                itemCount: foundWords.length,
                itemBuilder: (context, index){

                  Words words = foundWords[index];
                  return Card(
                    child: ListTile(
                      title:Text(words.word),
                      subtitle: Text(words.subtitle),
                      trailing: Icon(Icons.arrow_forward_ios_rounded),
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => WordsDetailsScreen(words)));
                      },

                    ),
                  );
                }
            ) :Center(child: Text("No words found", style: TextStyle(color: Colors.white),))

        ),

    );

  }


}


