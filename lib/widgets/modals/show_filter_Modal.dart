import 'package:flutter/material.dart';
import 'package:platzi_trips_app/widgets/buttonShop.dart';

class ShowFilterModal extends StatefulWidget {
  ShowFilterModal({Key? key}) : super(key: key);

  @override
  State<ShowFilterModal> createState() => _ShowFilterModalState();
}

class _ShowFilterModalState extends State<ShowFilterModal> {
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
  var selectedRange = RangeValues(150.00, 1500.00);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 10, left: 20, right: 20, bottom: 20),
      height: MediaQuery.of(context).size.height * 0.8,
      child: SingleChildScrollView(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Filter',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
              MaterialButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                minWidth: 40,
                height: 40,
                color: Colors.grey.shade300,
                elevation: 0,
                padding: EdgeInsets.all(0),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50)),
                child: Icon(
                  Icons.close,
                  color: Colors.black,
                ),
              )
            ],
          ),
          SizedBox(
            height: 10,
          ),
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
            height: 10,
          ),
          Text(
            'Size',
            style: TextStyle(
                color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
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
          // Slider Price Renge filter
          SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Price Range',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '\$ ${selectedRange.start.toStringAsFixed(2)}',
                    style: TextStyle(color: Colors.grey.shade500, fontSize: 12),
                  ),
                  Text(" - ", style: TextStyle(color: Colors.grey.shade500)),
                  Text(
                    '\$ ${selectedRange.end.toStringAsFixed(2)}',
                    style: TextStyle(color: Colors.grey.shade500, fontSize: 12),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          RangeSlider(
              values: selectedRange,
              min: 0.00,
              max: 2000.00,
              divisions: 100,
              inactiveColor: Colors.grey.shade300,
              activeColor: Colors.yellow[800],
              labels: RangeLabels(
                '\$ ${selectedRange.start.toStringAsFixed(2)}',
                '\$ ${selectedRange.end.toStringAsFixed(2)}',
              ),
              onChanged: (RangeValues values) {
                setState(() => selectedRange = values);
              }),
          SizedBox(
            height: 20,
          ),
          buttonShop(tittle: 'Filter', onPressed: () {})
        ],
      )),
    );
  }
}
