import 'package:flutter/material.dart';
import 'package:platzi_trips_app/features/home_shop/framework/model/product.dart';
import 'package:platzi_trips_app/widgets/animation/fade_animations.dart';

Widget productCart(Product? product, VoidCallback onPressed, VoidCallback onTap) {
  return AspectRatio(
    aspectRatio: 1 / 1,
    child: FadeAnimation(
        1.5,
        GestureDetector(
          onTap: onTap,
          child: Container(
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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 150,
                  child: Stack(
                    children: [
                      Container(
                        width: double.infinity,
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: Image.network(product!.url_imagen ?? "", fit: BoxFit.cover)),
                      ),
                      // Add to cart button
                      Positioned(
                        right: 5,
                        bottom: 5,
                        child: MaterialButton(
                          color: Colors.black,
                          minWidth: 45,
                          height: 45,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
                          onPressed: onPressed,
                          padding: EdgeInsets.all(5),
                          child: Center(
                              child: Icon(
                            Icons.shopping_cart,
                            color: Colors.white,
                            size: 20,
                          )),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  product!.nombre_producto ?? "",
                  maxLines: 1,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      product?.marca ?? "",
                      style: TextStyle(
                        color: Colors.orange.shade400,
                        fontSize: 14,
                      ),
                    ),
                    Text(
                      product!.priceLabel ?? "",
                      style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.w800),
                    ),
                  ],
                ),
              ],
            ),
          ),
        )),
  );
}
