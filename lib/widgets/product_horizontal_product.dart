import 'package:flutter/material.dart';
import 'package:platzi_trips_app/features/home_shop/framework/model/product.dart';
import 'package:platzi_trips_app/widgets/animation/fade_animations.dart';

Widget forYou(Product product) {
  return AspectRatio(
    aspectRatio: 3 / 1,
    child: FadeAnimation(
        1.5,
        Container(
          margin: EdgeInsets.only(right: 20, bottom: 25),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                offset: Offset(5, 10),
                blurRadius: 15,
                color: Colors.grey.shade200,
              )
            ],
          ),
          padding: EdgeInsets.all(10),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 100,
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(15), child: Image.network(product!.url_imagen ?? "", fit: BoxFit.cover)),
              ),
              SizedBox(
                width: 10,
              ),
              Expanded(
                child: Column(crossAxisAlignment: CrossAxisAlignment.start, mainAxisAlignment: MainAxisAlignment.center, children: [
                  Text(
                    product!.nombre_producto ?? "",
                    maxLines: 1,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    product?.marca ?? "",
                    style: TextStyle(
                      color: Colors.orange.shade400,
                      fontSize: 13,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    product!.priceLabel.toString(),
                    style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.w800),
                  ),
                ]),
              )
            ],
          ),
        )),
  );
}
