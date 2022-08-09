import 'package:flutter/material.dart';

import '../widgets/buttonShop.dart';

class addToCardModal extends StatefulWidget {
  addToCardModal({Key? key}) : super(key: key);

  @override
  State<addToCardModal> createState() => _addToCardModal();
}

class _addToCardModal extends State<addToCardModal> {
  List<dynamic> productList = [];
  List<String> size = [
    "S",
    "M",
    "L",
    "XL",
  ];

  List<Color> colors = [
    Colors.black,
    Colors.purple,
    Colors.orange.shade200,
    Colors.blueGrey,
    Color(0xFFFFC1D9),
  ];

  int _selectedColor = 0;
  int _selectedSize = 1;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 350,
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Color",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            height: 60,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: colors.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      _selectedColor = index;
                    });
                  },
                  child: AnimatedContainer(
                    duration: Duration(milliseconds: 300),
                    margin: EdgeInsets.only(right: 10),
                    decoration: BoxDecoration(
                        color: _selectedColor == index
                            ? colors[index]
                            : colors[index].withOpacity(0.5),
                        shape: BoxShape.circle),
                    width: 40,
                    height: 40,
                    child: Center(
                      child: _selectedColor == index
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
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            "Size",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            height: 60,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: size.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      _selectedSize = index;
                    });
                  },
                  child: AnimatedContainer(
                    duration: Duration(milliseconds: 500),
                    margin: EdgeInsets.only(right: 10),
                    decoration: BoxDecoration(
                        color: _selectedSize == index
                            ? Colors.yellow[800]
                            : Colors.grey.shade200,
                        shape: BoxShape.circle),
                    width: 40,
                    height: 40,
                    child: Center(
                      child: Text(
                        size[index],
                        style: TextStyle(
                            color: _selectedSize == index
                                ? Colors.white
                                : Colors.black,
                            fontSize: 15),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          SizedBox(
            height: 20,
          ),
          buttonShop(
              tittle: 'Add to Cart',
              onPressed: () {
                Navigator.pop(context);

                // Let's show a snackbar when an item is added to the cart
                final snackbar = SnackBar(
                  content: Text("Item added to cart"),
                  duration: Duration(seconds: 5),
                  action: SnackBarAction(
                    label: 'Undo',
                    onPressed: () {},
                  ),
                );

                ScaffoldMessenger.of(context).showSnackBar(snackbar);
              })
        ],
      ),
    );
  }
}
