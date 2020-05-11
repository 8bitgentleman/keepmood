import 'package:flutter/material.dart';
import 'package:multiselectchipgroup/multiselectchipgroup.dart';

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
  bool isSelected = false;
  String comment = "";
  List activities;
  List<SentimentRecording> today;

  @override
  AddActivityViewState(this.storage) ;

  bool notNull(Object o) => o != null;

  void _commentChanged(String newComment) {
    comment = newComment;
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: AppBar(
          title: Text("Activities"),
        ),
        backgroundColor: Colors.black,
        body: ListView(children: <Widget>[
          Container(
            child: Theme(
              data: ThemeData(
                  accentColor: Colors.purpleAccent,
                  unselectedWidgetColor:Colors.grey,
              ),
              child: ExpansionTile(
                title: new Text(
                    "Exercise",
                    style: TextStyle(
                      color: Colors.white70,
                    )
                ),
                backgroundColor: Theme.of(context).primaryColor.withOpacity(0.025),
                initiallyExpanded: true,
                children: <Widget>[
//                  TODO create custom multiSelect icon / chip widget
                  MultiSelectChipGroup(
                    items: [
                      'walking',
                      'morning exercise',
                      'exercise',
                      'sking',
                      'rock climbing'
                    ],
                    preSelectedItems: [

                    ],
                    onSelectionChanged: (values) {
//                      print(values);
//                      activities.clear();
                      activities = values;
                    },
                    labelFontSize:16,
                    leftIconSize:20,
                    horizontalChipSpacing: 10,
                    selectedColor: Colors.purple,
                    disabledColor: Colors.transparent,
                    labelSelectedColor: Colors.white,
                    iconSelectedColor: Colors.white,
                    leftCommonIcon: Icons.perm_identity,
                    leftIcons: [
                      Icons.directions_walk,
                      Icons.wb_sunny,
                      Icons.accessibility,
                      Icons.account_balance,
                      Icons.perm_identity,
                    ],
                  ),
                  FilterChip(
                    label: Text(
                      "Test",
                      style: Theme.of(context).textTheme.headline4.copyWith(
                        fontSize: 14.0,
                        color: Colors.grey,
                      ),
                    ),
                    backgroundColor: Colors.transparent,
                    shape: StadiumBorder(side: BorderSide(color: Colors.grey,)),
                    onSelected: (bool value) {print("selected");},
                  ),
                ]
    ),),
            margin: const EdgeInsets.all(14.0),
            decoration: new BoxDecoration(
              border: Border.all(
                color: Colors.grey,
                width: 1,
              ),
              borderRadius: BorderRadius.circular(4),
            ),
          ),
          Container(
              margin: const EdgeInsets.all(14.0),
              decoration: new BoxDecoration(
                border: Border.all(
                  color: Colors.grey.withOpacity(0.4),
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(4),
              ),
              child: Container(
                color: Colors.grey.withOpacity(0.4),
                padding: new EdgeInsets.symmetric(horizontal: 16.0),
                child: TextField(
                  maxLines: null,
//TODO: figure out how to expand this to allow readable text overflow
//                  expands: true,
//                controller: controller,
                onChanged: _commentChanged,
                decoration: new InputDecoration(
                  border: InputBorder.none,
                  focusColor: Colors.blue,
                  hintText: "Note",
                ),
              ),)
              ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            verticalDirection: VerticalDirection.up,
            children: [
//              Spacer(),
              Container(width: 50, height: 50, color: Colors.transparent),

              Column(
                children: [
                  RawMaterialButton(
                    onPressed: () {
                      print("Save");
                      print(activities);
                      print(comment);
                    },
                    elevation: 2.0,
                    fillColor: Colors.purpleAccent,
                    child: Icon(
                      Icons.check,
                      size: 35.0,
                    ),
                    padding: EdgeInsets.all(15.0),
                    shape: CircleBorder(),
                  ),
                  Container(
                    color: Colors.transparent,
                    height: 10,
                  ),
                  Text(
                      "Save",
                      style: TextStyle(
                        color: Colors.white70,
                      )
                  ),
                ],
              ),
              Column(
                children: [
                  Material(
                      color: Colors.transparent,
                      child: Ink(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.purpleAccent, width: 2.0),
                          color: Colors.transparent,
                          shape: BoxShape.circle,
                        ),
                        child: InkWell(
                          //This keeps the splash effect within the circle
                          borderRadius: BorderRadius.circular(1000.0), //Something large to ensure a circle
                          onTap: () {
                            print("Edit");
                          },
                          child: Padding(
                            padding:EdgeInsets.all(10.0),
                            child: Icon(
                              Icons.edit,
                              size: 24.0,
                              color: Colors.purpleAccent,
                            ),
                          ),
                        ),
                      )
                  ),
                  Container(
                    color: Colors.transparent,
                    height: 10,
                  ),
                  Text(
                      "Edit",
                      style: TextStyle(
                        color: Colors.white70,
                      )
                  ),
                ],
              ),

            ],
          ),

        ].where(notNull).toList()));
  }
}
