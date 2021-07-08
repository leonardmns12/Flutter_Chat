import 'package:flutter/material.dart';
import 'package:flutter_tutorial/models/app_model.dart';

class NewChat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return Column(
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
            color: Color(0xFFFEF9EB),
            borderRadius: BorderRadius.only(topLeft: Radius.circular(20.0), topRight: Radius.circular(20.0)),
          ),
          child: Padding(
            padding: EdgeInsets.only(left: 20.0, top: 10.0 , right: 5.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text("Favourite Contact",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.blueGrey , fontSize: 16.0)),
                IconButton(
                  icon: Icon(Icons.more_horiz),
                  iconSize: 20.0,
                  color: Colors.black,
                  onPressed: () {},
                )
              ],
            ),
          ),
        ),
        Container(
          height: 120,
          color: Color(0xFFFEF9EB),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: favourite_contact.length,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Column(children: <Widget>[
                    CircleAvatar(
                      radius: 35.0,
                      backgroundImage: AssetImage(favourite_contact[index].imageUrl)
                    ),
                    SizedBox(height: 8.0),
                    Text(favourite_contact[index].name , style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.blueGrey
                    ))
                  ],),
                );
              }
            ),
          ),
        )
      ],
    );
  }
}
