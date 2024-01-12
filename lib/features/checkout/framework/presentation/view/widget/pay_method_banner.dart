import 'package:flutter/material.dart';
import 'package:platzi_trips_app/features/checkout/framework/model/banner_dto.dart';
import 'package:platzi_trips_app/widgets/animation/fade_animations.dart';

Widget bannerWidget({required bool isCash, required BannerDto banner }) {
  return isCash == true
      ? FadeAnimation(
      1.2,
      AnimatedOpacity(
        duration: Duration(milliseconds: 500),
        opacity: isCash == true ? 1 : 0,
        child: Container(
          width: double.infinity,
          height: 200,
          padding: EdgeInsets.all(30.0),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
// color: Colors.grey.shade200
              gradient: LinearGradient(
                colors: [
                  Colors.green.shade200,
                  Colors.green.shade100,
                  Colors.green.shade200,
                  Colors.green.shade300,
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              )),
          child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
            Text(
              banner?.title ?? "",
              style: TextStyle(color: Colors.black),
            ),
            Image.network(banner?.icon ?? "", height: 110),
          ]),
        ),
      ))
      : FadeAnimation(
      1.2,
      AnimatedOpacity(
        duration: Duration(milliseconds: 500),
        opacity: isCash == false ? 1 : 0,
        child: Container(
          width: double.infinity,
          height: 200,
          padding: EdgeInsets.all(20.0),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              gradient: LinearGradient(
                colors: [
                  Colors.orange,
                  Colors.yellow.shade800,
                  Colors.yellow.shade900,
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              )),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  banner?.title ?? "",
                  style: TextStyle(color: Colors.white),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      banner?.text??"",
                      style: TextStyle(color: Colors.white, fontSize: 30),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          banner?.bottomText ?? "",
                          style: TextStyle(color: Colors.white),
                        ),
                        Image.network(banner?.icon ?? "", height: 50),
                      ],
                    )
                  ],
                )
              ]),
        ),
      ));
}
