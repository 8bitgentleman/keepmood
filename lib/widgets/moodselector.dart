import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:intl/intl.dart';

import '../sentiment.dart';

class MoodSelector extends StatefulWidget {
  final ValueSetter<SentimentRecording> onSelected;
  MoodSelector({Key key, @required this.onSelected}) : super(key: key);

  @override
  createState() => new MoodSelectorState(onSelected);
}

class MoodSelectorState extends State<MoodSelector> {
  var timeFormatter = new DateFormat('jm');
  var dayFormatter = new DateFormat('MMMd');
  DateTime selectedDate = DateTime.now();

  final ValueSetter<SentimentRecording> onSelected;
  String comment = "";
  TextEditingController controller = new TextEditingController();

  MoodSelectorState(this.onSelected);

  void _handleSentiment(Sentiment sentiment) {
    onSelected(new SentimentRecording(sentiment, selectedDate,
        comment: comment));
    controller = new TextEditingController();
  }

  void _commentChanged(String newComment) {
    comment = newComment;
  }

  Future<Null> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
  }

//  Future<TimeOfDay> selectedTime = showTimePicker(
//    initialTime: TimeOfDay.now(),
//    context: context,
//  );

  @override
  Widget build(BuildContext context) {
    return new Card(
        child: Column(
          children: <Widget>[
            ListTile(
              title: Center(child:
                Text(
                    "HOW DO YOU FEEL?",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        height: 5,
                        fontSize: 20),
                    )
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
//                SizedBox(height: 8.0),
                Icon(
                  Icons.calendar_today,
                  color: Colors.purple,
                  size: 20.0,
                ),
                FlatButton(
                  onPressed: () => _selectDate(context),
                  textColor: Colors.white,
                  child: Text(
                    "${dayFormatter.format(selectedDate.toLocal())}",
                    style: TextStyle(
                      color:Colors.purple,
                      decoration: TextDecoration.underline,
                      fontSize: 20,
                    ),

                  ),
                ),
                SizedBox(height: 10.0, width:10),
                Icon(
                  Icons.access_time,
                  color: Colors.purple,
                  size: 20.0,
                ),
                FlatButton(
                  onPressed: () => _selectDate(context),
                  textColor: Colors.white,
                  child: Text(
                    "${timeFormatter.format(selectedDate.toLocal())}",
                    style: TextStyle(
                      color:Colors.purple,
                      decoration: TextDecoration.underline,
                      fontSize: 20,
                    ),

                  ),
                ),
              ],
            ),


            ButtonBar(
                children: <Widget>[ButtonBar(
                  alignment: MainAxisAlignment.spaceEvenly,
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    IconButton(
                        onPressed: () => _handleSentiment(Sentiment.veryHappy),
                        icon: Icon(Icons.sentiment_very_satisfied),
                        iconSize: 40.0,
                        color: Colors.orange),
                    IconButton(
                        onPressed: () => _handleSentiment(Sentiment.happy),
                        icon: Icon(Icons.sentiment_satisfied),
                        iconSize: 40.0,
                        color: Colors.green),
                    IconButton(
                        onPressed: () => _handleSentiment(Sentiment.neutral),
                        icon: Icon(Icons.sentiment_neutral),
                        iconSize: 40.0,
                        color: Colors.purple),
                    IconButton(
                        onPressed: () => _handleSentiment(Sentiment.unhappy),
                        icon: Icon(Icons.sentiment_dissatisfied),
                        iconSize: 40.0,
                        color: Colors.blue[800]),
                    IconButton(
                        onPressed: () => _handleSentiment(Sentiment.veryUnhappy),
                        icon: Icon(Icons.sentiment_very_dissatisfied),
                        iconSize: 40.0,
                        color: Colors.blueGrey),
                  ],
                )]),
          ],
        ));
  }
}
