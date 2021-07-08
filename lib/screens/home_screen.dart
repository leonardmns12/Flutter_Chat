import "package:flutter/material.dart";
import 'package:flutter_tutorial/widgets/category_selector.dart';
import 'package:flutter_tutorial/widgets/new_chat.dart';
import 'package:flutter_tutorial/widgets/recent_chat.dart';

class HomeScreen extends StatefulWidget {
  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.menu),
            iconSize: 30,
            color: Colors.white,
            onPressed: () {},
          ),
          actions: <Widget>[
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.search),
              color: Colors.white,
              iconSize: 30,
            )
          ],
          backgroundColor: Colors.red,
          title: Text("Maybank Chats"),
        ),
        backgroundColor: Colors.red,
        body: Column(
          children: <Widget>[
            CategorySelector(),
            Expanded(
              child: Container(
                height: 500,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30.0),
                      topRight: Radius.circular(30.0)),
                ),
                child: Column(
                  children: <Widget>[
                    NewChat(),
                    RecentChat()
                  ],
                ),
              ),
            )
          ],
        ));
  }
}
