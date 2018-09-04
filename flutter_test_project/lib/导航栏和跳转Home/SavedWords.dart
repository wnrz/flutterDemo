import 'package:flutter/material.dart';


class SavedWords extends StatefulWidget {
  final Set tiles;
  SavedWords({Key key, @required this.tiles}) : super(key: key);
  @override
  createState() => new SavedWordsState();
}

class SavedWordsState extends State<SavedWords> {
  Set tiles;
  final _biggerFont = const TextStyle(fontSize: 18.0);
  @override
    Widget build(BuildContext context) {
      tiles = new Set.from(widget.tiles);
      // TODO: implement build
      final divided = ListTile
        .divideTiles(
          context: context,
          tiles: tiles.map(
            (pair) {
              return new ListTile(
                title: new Text(
                  pair.asPascalCase,
                  style: _biggerFont,
                ),
              );
            },
          )
        ,
        )
        .toList();
        
        divided.add(new Divider());
        divided.add(new ListTile(title: new Text('End',style:const TextStyle(fontSize: 18.0))));
        divided.add(new Divider());
        ListView listView = new ListView(children: divided);
        return new Scaffold(
        appBar: new AppBar(
          title: new Text('Saved Suggestions'),
        ),
        body: listView,
      );
    }
}