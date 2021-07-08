import "package:flutter/material.dart";
import 'package:flutter_tutorial/models/app_model.dart';
import 'package:flutter_tutorial/screens/chat_screen.dart';

class RecentChat extends StatefulWidget {
  RecentChatState createState() => RecentChatState();
}

class RecentChatState extends State<RecentChat> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ClipRRect(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.0), topRight: Radius.circular(20.0)),
        child: ListView.builder(
            itemCount: recent_chat.length,
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => ChatScreen(recent_chat[index].user))
                      );
                },
                child: Container(
                  margin: EdgeInsets.only(top: 10.0, right: 20.0),
                  padding: EdgeInsets.only(
                      top: 10.0, bottom: 10.0, left: 5.0, right: 10.0),
                  decoration: BoxDecoration(
                      color: recent_chat[index].unread
                          ? Color(0xFFFFEFEE)
                          : Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(20.0))),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          CircleAvatar(
                            radius: 35.0,
                            backgroundImage:
                                AssetImage(recent_chat[index].user.imageUrl),
                          ),
                          SizedBox(width: 10.0),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(recent_chat[index].user.name,
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold)),
                              Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.45,
                                  child: Text(recent_chat[index].content,
                                      style: TextStyle(color: Colors.blueGrey),
                                      overflow: TextOverflow.ellipsis))
                            ],
                          ),
                        ],
                      ),
                      Column(
                        children: <Widget>[
                          Text(recent_chat[index].time,
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          recent_chat[index].unread
                              ? Container(
                                  width: 40.0,
                                  height: 20.0,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(20.0)),
                                      color: Colors.red),
                                  child: Text("NEW",
                                      style: TextStyle(
                                          fontSize: 10.0,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white)),
                                )
                              : Text("")
                        ],
                      )
                    ],
                  ),
                ),
              );
            }),
      ),
    );
  }
}
