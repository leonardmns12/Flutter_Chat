import 'package:flutter/material.dart';
import 'package:flutter_tutorial/models/app_model.dart';
import 'package:flutter_tutorial/models/user.dart';
import 'package:intl/intl.dart';

class ChatScreen extends StatefulWidget {
  final User user;
  ChatScreen(this.user);
  @override
  ChatScreenState createState() => ChatScreenState();
}

class ChatScreenState extends State<ChatScreen> {
  final textController = TextEditingController();
  _MessageBuilder(Message msg, bool isMe, int index) {
    final msgContent = Container(
          padding: EdgeInsets.symmetric(horizontal: 25.0 , vertical: 15.0),
          width: MediaQuery.of(context).size.width * 0.75,
          decoration: BoxDecoration(
              color: isMe ? Color(0xFFFEF9EB) : Color(0xFFFFEFEE),
              borderRadius: isMe
                  ? BorderRadius.only(
                      topLeft: Radius.circular(12.0),
                      bottomLeft: Radius.circular(12.0))
                  : BorderRadius.only(
                      topRight: Radius.circular(12.0),
                      bottomRight: Radius.circular(12.0)
                      )
                    ),
          margin: isMe
              ? EdgeInsets.only(left: 80.0, top: 10.0, bottom: 10.0)
              : EdgeInsets.only(top: 10.0, bottom: 10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(msg.time , style: TextStyle(fontWeight : FontWeight.w600 , color: Colors.grey)),
              Text(msg.content , style: TextStyle(fontWeight : FontWeight.bold , color: Colors.blueGrey))
            ]
          )
    );
    if(isMe) {
      return msgContent;
    }
    return Row(
      children: <Widget>[
        msgContent,
        IconButton(
          icon: msg.isLiked ? Icon(Icons.favorite) : Icon(Icons.favorite_border),
          color: msg.isLiked ? Colors.red : Colors.blueGrey,
          iconSize: 30.0,
          onPressed: () { setState(() {
            list_chat[index].isLiked = list_chat[index].isLiked ? false : true;
          });}
        )
      ],
    );
  }

  void dispose() {
    textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final textfield = Container(
        padding: EdgeInsets.all(10.0),
        color: Colors.white,
        width: MediaQuery.of(context).size.width,
        height: 70,
        child: Row(
          children: <Widget>[
            IconButton(
              color: Colors.red,
              icon: Icon(Icons.photo),
              onPressed: (){},
              iconSize: 30.0,
            ),
            Expanded(
              child: TextField(
                controller: textController,
                textCapitalization: TextCapitalization.sentences,
                decoration: InputDecoration.collapsed(
                  hintText: "Send a message..."
                )
              ),
            ),
            IconButton(
              color: Colors.red,
              icon: Icon(Icons.send),
              onPressed: (){ setState(() {
                list_chat.add(new Message(textController.text , leonard , DateFormat('hh:mm').format(DateTime.now()) , false , false));
                textController.clear();
              });},
              iconSize: 30.0,
            )
          ],
        ),
    );

    return Scaffold(
        backgroundColor: Colors.red,
        appBar: AppBar(
          title: Text(widget.user.name),
          backgroundColor: Colors.red,
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.more_horiz),
              iconSize: 30,
              onPressed: () {},
              color: Colors.white,
            )
          ],
        ),
        body: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Column(children: <Widget>[
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30.0),
                        topRight: Radius.circular(30.0))),
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30.0),
                      topRight: Radius.circular(30.0)),
                  child: ListView.builder(
                      itemCount: list_chat.length,
                      itemBuilder: (BuildContext context, int index) {
                        final bool isMe =
                            list_chat[index].user.id == 1 ? true : false;
                        return _MessageBuilder(list_chat[index], isMe , index);
                      }),
                ),
              ),
            ),
            textfield
          ]),
        )
      );
  }
}
