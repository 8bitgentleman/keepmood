import 'package:flutter/material.dart';

import 'views/moodview.dart';
import 'views/addactivityview.dart';

void main() => runApp(new KeepMood());

class KeepMood extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        title: 'KeepMood',
        home: new AddActivityView(),
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          brightness: Brightness.dark,
          primaryColor: Colors.purple,
//          accentColor: Colors.purple,

        ));
  }
}

