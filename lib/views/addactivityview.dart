import 'package:flutter/material.dart';

import '../moodstorage.dart';
import '../sentiment.dart';

class AddActivityView extends StatefulWidget {
  final MoodStorage storage;

  AddActivityView({Key key, @required this.storage}) : super(key: key);

  @override
  createState() => new AddActivityViewState(storage);
}

class AddActivityViewState extends State<AddActivityView> {
  final MoodStorage storage;
  List<SentimentRecording> today;

  @override
  AddActivityViewState(this.storage) ;

  bool notNull(Object o) => o != null;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: AppBar(
          title: Text("Activities"),
        ),
        body: ListView(children: <Widget>[
          ExpansionTile(
              title: new Text("Group Name"),
              backgroundColor: Theme.of(context).accentColor.withOpacity(0.025),
              initiallyExpanded: true,
              children: <Widget>[]
          ),
        ].where(notNull).toList()));
  }
}
