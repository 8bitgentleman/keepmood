import 'package:flutter/material.dart';
import '../sentiment.dart';
import 'package:intl/intl.dart';

class MoodEvent extends StatelessWidget {
  MoodEvent({Key key, @required this.recording, @required this.onDelete})
      : super(key: key);

  final SentimentRecording recording;
  final ValueSetter<int> onDelete;
  final timeFormatter = new DateFormat('jm');
  final dayFormatter = new DateFormat('MMMMEEEEd');
  void _delete() => onDelete(recording.id);

  bool notNull(Object o) => o != null;

  String timeDifferenceString(DateTime time) {
    int days = new DateTime.now().difference(time).inDays;
    if (days == 0) {
      int hours = new DateTime.now().difference(time).inHours;
      if (hours == 1) {
        return hours.toString() + " hour ago";
      }
      if (hours > 1) {
        return hours.toString() + " hours ago";
      }
      int minutes = new DateTime.now().difference(time).inMinutes;
      if (minutes == 1) {
        return minutes.toString() + " minute ago";
      }
      return minutes.toString() + " minutes ago";
    }
    if (days == 1) {
      return days.toString() + " day ago";
    }
    return days.toString() + " days ago";
  }

  Color sentimentToColor(Sentiment sentiment) {
    switch (sentiment) {
      case Sentiment.veryHappy:
        return Colors.orange;
        break;
      case Sentiment.happy:
        return Colors.green;
        break;
      case Sentiment.unhappy:
        return Colors.blue[800];
        break;
      case Sentiment.veryUnhappy:
        return Colors.blueGrey;
        break;
      default:
        return Colors.purple;
        break;
    }
  }

  IconData sentimentToIcon(Sentiment sentiment) {
    switch (sentiment) {
      case Sentiment.veryHappy:
        return Icons.sentiment_very_satisfied;
        break;
      case Sentiment.happy:
        return Icons.sentiment_satisfied;
        break;
      case Sentiment.unhappy:
        return Icons.sentiment_dissatisfied;
        break;
      case Sentiment.veryUnhappy:
        return Icons.sentiment_very_dissatisfied;
        break;
      default:
        return Icons.sentiment_neutral;
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
        child: Column(
            children: <Widget>[
      ClipRRect(
          clipBehavior: Clip.antiAlias,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(5.0),
              topRight: Radius.circular( 5.0)
          ),
          child: Container(
              color: sentimentToColor(recording.sentiment),
              child: ListTile(
                leading: Icon(Icons.album),
                title: Text(dayFormatter.format(recording.time)),
                enabled: false,
              )),
      ),

      ListTile(
          leading: Icon(
            sentimentToIcon(recording.sentiment),
            color: sentimentToColor(recording.sentiment),
            size: 48.0,
          ),
          title: new Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: 8.0),
              new Text(sentimentString(recording.sentiment).toUpperCase(),
                style: TextStyle(
                fontSize: 20,
                color: sentimentToColor(recording.sentiment),
              )),
              SizedBox(width: 8.0),
              Text(timeFormatter.format(recording.time)),
            ],
          ),
          subtitle: Text(sentimentString(recording.sentiment))),
      new ButtonBar(
        children: <Widget>[
          FlatButton(
            child: Text("Delete"),
            onPressed: _delete,
          )
        ],
      )
    ].where(notNull).toList()));
  }
}
