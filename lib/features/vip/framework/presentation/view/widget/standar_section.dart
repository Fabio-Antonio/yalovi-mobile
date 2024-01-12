import 'package:flutter/material.dart';

Widget getStandarSection(List<String> values,int selectedItem){
  return Container(
    height: 60,
    child: ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: values?.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {

          },
          child: AnimatedContainer(
            duration: Duration(milliseconds: 500),
            margin: EdgeInsets.only(right: 10),
            decoration: BoxDecoration(
                color: selectedItem == index ? Colors.yellow[800] : Colors.grey.shade200,
                shape: BoxShape.circle),
            width: 40,
            height: 40,
            child: Center(
              child: Text(
                values?[index]??"",
                style:
                TextStyle(color: selectedItem == index ? Colors.white : Colors.black, fontSize: 15),
              ),
            ),
          ),
        );
      },
    ),
  );
}