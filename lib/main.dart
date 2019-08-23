import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final wordPair = new WordPair.random();
    return new MaterialApp(
      title: 'Welcome to Flutter',
      home: RandomWords(),
    );
  }
}

class RandomWords extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new RandomWordsState();
  }
}

class RandomWordsState extends State<RandomWords> {
  final _suggestions = <WordPair>[];

  final _saved = new List<WordPair>();

  final _biggerFont = const TextStyle(fontSize: 18.0);

  @override
  Widget build(BuildContext context) {
/*    final wordPair = new WordPair.random();
    return new Text(wordPair.asPascalCase);*/
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('OwO'),
      ),
      body: _buildSuggestions(),
    );
  }

  Widget _buildSuggestions() {
    return new ListView.builder(
     /*   padding: const EdgeInsets.all(30.0),*/
        itemBuilder: (context, i) {

          if (i.isOdd) return new Divider();

          final index = i ~/ 2;
          if (index >= _suggestions.length) {
            _suggestions.addAll(generateWordPairs().take(10));
          }
          //return _buildRow(_suggestions[index]);
          return _buildRow(WordPair("Biu~~", "Zhangyf~~"));
        });
  }

  Widget _buildRow(WordPair wordPair) {
    final alreadySaved = _saved.contains(wordPair);

    return new ListTile(
      title: new Text(
        wordPair.asPascalCase,
        style: _biggerFont,
      ),
      trailing: new Icon(
        alreadySaved ? Icons.favorite : Icons.favorite_border,
        color: alreadySaved ? Colors.red : null,
      ),
      onTap: () {
        setState(() {
          if (alreadySaved) {
            _saved.remove(wordPair);
          } else {
            _saved.add(wordPair);
          }
        });
      },
    );
  }
}
