import 'package:flutter/material.dart';
import 'package:platzi_trips_app/core/utils/colors.dart';

Widget colorSection(List<String>? values, int selectedPosition) {
  return Container(
    height: 60,
    child: ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: values?.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {},
          child: AnimatedContainer(
            duration: Duration(milliseconds: 300),
            margin: EdgeInsets.only(right: 10),
            decoration: BoxDecoration(
                color: selectedPosition == index
                    ? ColorsHandler.parseColor(values?[index] ?? '')
                    : ColorsHandler.parseColor(values?[index] ?? '').withOpacity(0.5),
                shape: BoxShape.circle),
            width: 40,
            height: 40,
            child: Center(
              child: selectedPosition == index
                  ? Icon(
                      Icons.check,
                      color: Colors.white,
                    )
                  : Container(),
            ),
          ),
        );
      },
    ),
  );
}
