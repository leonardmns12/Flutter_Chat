import "package:flutter/material.dart";

class CategorySelector extends StatefulWidget {
  @override
  CategorySelectorState createState() => CategorySelectorState();
}

class CategorySelectorState extends State<CategorySelector> {
  final List<String> category = ["Pesan" , "Teman" , "Grup" , "Permintaan"];
  int selectedIndex = 0;
  @override 
  Widget build (BuildContext context) {
    return Container(
      color: Colors.red,
      height: 80,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: category.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              setState(() {
                selectedIndex = index;
              });
            },
            child: Padding(
              child: Text(category[index] , style: TextStyle(
                fontSize : 18,
                fontWeight: FontWeight.bold,
                color: selectedIndex == index ? Colors.white : Colors.white60,
                letterSpacing: 1.2
              )),
              padding: EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 30
                )
            )
          );
        }
      )
    );
  }
}